main :: () {
    trix_html := "<div>Makerspace Wien • Fantasiestraße 3, 1010 Wien<figure data-trix-attachment=\"{&quot;contentType&quot;:&quot;image/png&quot;,&quot;filename&quot;:&quot;HL_LOGO_transparent 3.png&quot;,&quot;filesize&quot;:51297,&quot;height&quot;:1391,&quot;url&quot;:&quot;http://localhost:3000/api/v1/blobs/Fe26.2**30e4922f55d2c33f792242a87aadc65f2be65626dad7c4b642f5a48a071c2d18*WAJIkWqsUdzGfugBJWClvA*uuPfUAnNBobQrGj4H2EbGQ**c9957af042a133d77f896f9ca2fb114c876f721d187b1d0a7400607d3a7b64cb*5CRwUFJjxnAoEZl5AyTLWguIKXLFtEaXQPg3_sJ10Ec/HL_LOGO_transparent%203.png&quot;,&quot;width&quot;:596}\" data-trix-content-type=\"image/png\" data-trix-attributes=\"{&quot;presentation&quot;:&quot;gallery&quot;}\" class=\"attachment attachment--preview attachment--png\"><img src=\"http://localhost:3000/api/v1/blobs/Fe26.2**30e4922f55d2c33f792242a87aadc65f2be65626dad7c4b642f5a48a071c2d18*WAJIkWqsUdzGfugBJWClvA*uuPfUAnNBobQrGj4H2EbGQ**c9957af042a133d77f896f9ca2fb114c876f721d187b1d0a7400607d3a7b64cb*5CRwUFJjxnAoEZl5AyTLWguIKXLFtEaXQPg3_sJ10Ec/HL_LOGO_transparent%203.png\" width=\"596\" height=\"1391\"><figcaption class=\"attachment__caption\"></figcaption></figure></div>";
    trix_html2 := "<ul><li>We</li><li><strong>want</strong></li><li>bullets!</li></ul><div><br></div><ol><li>And</li><li><em>lists!</em></li><li>With <del>strikethrough</del> items</li></ol><div><br>And how about a <a href=\"https://fabman.io\">link</a> to make things hard?</div>";

    check_for_error :: (result: s32, loc := #caller_location) {
        if result < 0 {
            log_error("Error at %: %", loc, result);
            exit(1);
        }
    }

    // Example 1: Using tidy’s built-in allocator (which means you have to be careful about freeing stuff!)
    {
        doc := tidyCreate();
        defer release(doc);

        // Disable wrapping
        optSetInt(doc, .WrapLen, 0);

        error_buffer: TidyBuffer;
        defer bufFree(*error_buffer);
        result := setErrorBuffer(doc, *error_buffer);
        check_for_error(result);

        {
            result =parseString(doc, trix_html.data);
            check_for_error(result);

            output_buffer: TidyBuffer;
            defer bufFree(*output_buffer);
            result = saveBuffer(doc, *output_buffer);
            check_for_error(result);

            log("Result:\n%", to_string(output_buffer.bp));
            debug_log_nodes(doc);
        }
        {
            result = parseString(doc, trix_html2.data);
            check_for_error(result);

            output_buffer: TidyBuffer;
            defer bufFree(*output_buffer);
            result = saveBuffer(doc, *output_buffer);
            check_for_error(result);

            log("Result 2:\n%", to_string(output_buffer.bp));
            debug_log_nodes(doc);
        }

        error_string := to_string(error_buffer.bp);
        if error_string log("Diagnostics: %", to_string(error_buffer.bp));
    }

    // Example 2: Using a jai allocator instead of tidy’s allocator
    {
        pool: Pool;
        set_allocators(*pool);
        push_allocator(pool_allocator_proc, *pool);

        tidy_allocator := create_tidy_allocator();
        {
            doc := createWithAllocator(tidy_allocator);

            // Disable wrapping
            optSetInt(doc, .WrapLen, 0);

            error_buffer: TidyBuffer;
            bufInitWithAllocator(*error_buffer, tidy_allocator);

            result := setErrorBuffer(doc, *error_buffer);
            check_for_error(result);

            {
                result = parseString(doc, trix_html.data);
                check_for_error(result);

                output_buffer: TidyBuffer;
                bufInitWithAllocator(*output_buffer, tidy_allocator);
                result = saveBuffer(doc, *output_buffer);
                check_for_error(result);

                log("Result:\n%", to_string(output_buffer.bp));
                debug_log_nodes(doc);
            }

            error_string := to_string(error_buffer.bp);
            if error_string log("Diagnostics: %", to_string(error_buffer.bp));
        }

        inband, outband := calculate_used_memory(pool);
        log("This example used % bytes of pool memory + % outband allocations of at least % each", inband, outband, pool.oversized_size);
    }
}

#import,file "../module.jai";

#import "Basic";
#import "Pool";
