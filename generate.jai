AT_COMPILE_TIME :: true;

LIBTIDY_PATH :: "source";

DECLARATIONS_TO_OMIT :: string.[
    "SUPPORT_LOCALIZATIONS",
    "SUPPORT_CONSOLE_APP",
    "PLATFORM_NAME",
    "FILENAMES_CASE_SENSITIVE",
    "PRESERVE_FILE_TIMES",
    "HAS_FUTIME",
    "UTIME_NEEDS_CLOSED_FILE",
    "HAS_VSNPRINTF",
    "SUPPORT_POSIX_MAPPED_FILES",

    "TidyReportCallback", // Uses va_list, which we don't support in Jai yet.
    "tidySetReportCallback", // Because we don't have TidyReportCallback
];

#if AT_COMPILE_TIME {
    #run,stallable {
        set_build_options_dc(.{do_output=false});
        options := get_build_options();
        args := options.compile_time_command_line;
        if !generate_bindings(args, options.minimum_os_version) {
            compiler_set_workspace_status(.FAILED);
        }
    }
} else {
    #import "System";

    main :: () {
        set_working_directory(path_strip_filename(get_path_of_running_executable()));
        if !generate_bindings(get_command_line_arguments(), #run get_build_options().minimum_os_version) {
            exit(1);
        }
    }
}

generate_bindings :: (args: [] string, minimum_os_version: type_of(Build_Options.minimum_os_version)) -> bool {
    target_x64     := array_find(args, "-x64");
    target_arm     := array_find(args, "-arm64");
    compile        := array_find(args, "-compile");
    compile_debug  := array_find(args, "-debug");

    os_target  := OS;
    cpu_target := CPU;
    if target_x64     cpu_target = .X64;
    if target_arm     cpu_target = .ARM64;

    lib_directory: string;
    if os_target == {
        case .WINDOWS;
            lib_directory = "windows";
        case .LINUX;
            lib_directory = "linux";
        case .MACOS;
            lib_directory = "macos";
        case;
            assert(false);
    }


    if compile {
        if os_target == .MACOS {
            lib_directory_x64 := join(lib_directory, "_x64",, temp);
            lib_directory_arm64 := join(lib_directory, "_arm64",, temp);
            success := compile_libtidy_variant(os_target, .X64,   .{10, 13}, lib_directory_x64,   compile_debug = compile_debug);
            if !success return false;
            success  = compile_libtidy_variant(os_target, .ARM64, .{11, 0},  lib_directory_arm64, compile_debug = compile_debug);
            if !success return false;

            // Create universal binaries out of the two arch builds:
            success = make_directory_if_it_does_not_exist(lib_directory);
            if !success {
                log_error("Could not create directory \"%\"\n", lib_directory);
                return false;
            }
            universal_dylib_path := tprint("%/libtidy.dylib", lib_directory);
            run_or_exit("lipo", "-create", tprint("%/lib/libtidy.dylib", lib_directory_x64), tprint("%/lib/libtidy.dylib", lib_directory_arm64), "-output", universal_dylib_path);
            run_or_exit("lipo", "-create", tprint("%/lib/libtidy.a",     lib_directory_x64), tprint("%/lib/libtidy.a",     lib_directory_arm64), "-output", tprint("%/libtidy.a", lib_directory));
             // Fix the dynamic library’s ID since we copied the symlinked short name variant. Otherwise the library still thinks it’s called "libtidy.5.8.0.dylib" and anything you link against it will look for the versioned library name.
            run_or_exit("install_name_tool", "-id", "@rpath/libtidy.dylib", universal_dylib_path);
        } else {
            success := compile_libtidy_variant(os_target, .X64, minimum_os_version, lib_directory, compile_debug = compile_debug);
            if !success return false;
        }
	}

    output_filename: string;
    opts: Generate_Bindings_Options;
    {
        using opts;

        array_add(*libpaths, lib_directory);
		output_filename = "unix.jai";
		generate_library_declarations = false;
		footer = FOOTER_UNIX;

		libtidy_include_path := "source/include";
        array_add(*libpaths,      lib_directory);
        array_add(*libnames,      "libtidy");
        array_add(*include_paths, libtidy_include_path);
        array_add(*source_files,  tprint("%/tidy.h", libtidy_include_path));
        array_add(*source_files,  tprint("%/tidybuffio.h", libtidy_include_path));

        array_add(*strip_enum_value_prefixes, .["TidyOptionId", "Tidy"]);

        alias_original_enum_names           = false;
        log_stripped_declarations           = true;
        generate_compile_time_struct_checks = true;

        visitor   = libtidy_visitor;
    }

    return generate_bindings(opts, output_filename);
}

#if OS == .LINUX {
    PLATFORM_NAME :: "linux";
} else #if OS == .MACOS {
    PLATFORM_NAME :: "macos";
} else {
    compiler_report(tprint("Unsupported platform: %", OS));
}

compile_libtidy_variant :: (os_target: Operating_System_Tag, cpu_target: CPU_Tag, minimum_os_version: type_of(Build_Options.minimum_os_version), target_directory: string, compile_debug: bool) -> bool {
    install_dir := target_directory;
    success := make_directory_if_it_does_not_exist(install_dir);
    if !success {
        log_error("Could not create directory \"%\"\n", install_dir);
		return false;
    }

	absolute_install_dir := get_absolute_path(install_dir);
	assert(absolute_install_dir != "");

    absolute_build_dir := join(absolute_install_dir, "_build");
    log("Configuring libtidy... \"%\" -> \"%\"", absolute_build_dir, absolute_install_dir);
	if file_exists(absolute_build_dir) {
		success := delete_directory(absolute_build_dir);
		if !success {
			log_error("Could not delete old build directory");
			return false;
		}
	}
    success = make_directory_if_it_does_not_exist(absolute_build_dir);
    if !success {
        log_error("Could not create directory \"%\"\n", absolute_build_dir);
		return false;
    }

	absolute_libtidy_path := get_absolute_path(LIBTIDY_PATH);
    config_command: [..] string;
    array_add(*config_command,
		"cmake",
		absolute_libtidy_path,
		"-DSUPPORT_CONSOLE_APP=OFF",
        "-DSUPPORT_LOCALIZATIONS=OFF", // Remove this if you want localized error messages
        tprint("-DCMAKE_INSTALL_PREFIX=%", absolute_install_dir),
        tprint("-DCMAKE_PREFIX_PATH=%",    install_dir),
	);

    if compile_debug {
        array_add(*config_command, "-DCMAKE_BUILD_TYPE=Debug");
    }

    #if OS == .MACOS {
        arch_name := ifx cpu_target == .X64 then "x86_64" else "arm64";
        array_add(*config_command,
            tprint("-DCMAKE_OSX_ARCHITECTURES=%", arch_name),
            tprint("-DCMAKE_OSX_DEPLOYMENT_TARGET=%.%", minimum_os_version.major, minimum_os_version.minor),
        );
    }
    run_or_exit(..config_command, working_directory = absolute_build_dir);
    log("Done configuring libtidy");

    log("Building libtidy…");
    build_command: [..] string;
    array_add(*build_command, "cmake", "--build", absolute_build_dir, "--target", "install");
    run_or_exit(..build_command);
	log("Done building libtidy");

	return true;
}

run_or_exit :: (command: .. string, working_directory := "") -> string {
    // Enable this to see the commands being executed.
    // Might be useful if, for example, you need to compile LLVM on a platform where we don’t have a Jai compiler yet and want to do it manually.
    // log("Executing command \"%\" in directory \"%\"\n", join(..command, separator = " "), working_directory);

    result, output_string, error_string := run_command(..command, working_directory = working_directory, capture_and_return_output = true, print_captured_output = true);
    defer {
        free(error_string);
    }
    if result.exit_code != 0 {
        log_error("Could not run command \"%\" in directory \"%\". Exit code: %\nError:\n%", get_quoted_command_string(command), working_directory, result.exit_code, error_string);
        // if !LIVE_OUTPUT {
        //     log_error("Output:\n%", output_string);
        // }
        exit(1);
    }
    return output_string;
}


libtidy_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    if !parent_decl {
        if array_find(DECLARATIONS_TO_OMIT, decl.name) {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }

        // Remove the "tidy" prefix from function names
        if decl.kind == .FUNCTION && decl.output_name.count > 4 && begins_with(decl.output_name, "tidy") && decl.output_name != "tidyCreate" {
            decl.output_name = slice(decl.output_name, 4, decl.output_name.count - 4);
            decl.output_name[0] = to_lower(decl.output_name[0]);
        }
    }

    return .RECURSE;
}

#import "Basic";
#import "Bindings_Generator";
#import "Compiler";
#import "File";
#import "File_Utilities";
#import "String";
#import "Process";

FOOTER_UNIX :: #string END

#if OS == .MACOS    libtidy :: #library "macos/libtidy";
#if OS == .LINUX    libtidy :: #library "linux/lib/libtidy";

END

