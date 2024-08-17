//
// This file was auto-generated using the following command:
//
// jai generate.jai
//



NULLSTR :: cast(tmbstr) "";

EndOfStream :: ~0;

byte :: u8;

tchar :: u32;
tmbchar :: u8;

tmbstr :: *tmbchar;
ctmbstr :: *tmbchar;

/* We could use the C99 definition where supported
typedef _Bool Bool;
#define no (_Bool)0
#define yes (_Bool)1
*/
Bool :: enum u32 {
    no  :: 0;
    yes :: 1;
}

_TidyIterator :: struct {
    _opaque: s32;
}
TidyIterator :: *_TidyIterator;

/** Option IDs are used used to get and/or set configuration option values and
**        retrieve their descriptions.
**
** @remark These enum members all have associated localized strings available
**         which describe the purpose of the option. These descriptions are
**         available via their enum values only.
**
** @sa     `config.c:option_defs[]` for internal implementation details; that
**         array is where you will implement options defined in this enum; and
**         it's important to add a string describing the option to
**         `language_en.h`, too.
*/
TidyOptionId :: enum u32 {
    UnknownOption           :: 0;

    AccessibilityCheckLevel :: 1;
    AltText                 :: 2;
    AnchorAsName            :: 3;
    AsciiChars              :: 4;
    BlockTags               :: 5;
    BodyOnly                :: 6;
    BreakBeforeBR           :: 7;
    CharEncoding            :: 8;
    CoerceEndTags           :: 9;
    CSSPrefix               :: 10;

    CustomTags              :: 11;

    DecorateInferredUL      :: 12;
    Doctype                 :: 13;

    DoctypeMode             :: 14;

    DropEmptyElems          :: 15;
    DropEmptyParas          :: 16;
    DropPropAttrs           :: 17;
    DuplicateAttrs          :: 18;
    Emacs                   :: 19;

    EmacsFile               :: 20;

    EmptyTags               :: 21;
    EncloseBlockText        :: 22;
    EncloseBodyText         :: 23;
    ErrFile                 :: 24;
    EscapeCdata             :: 25;
    EscapeScripts           :: 26;
    FixBackslash            :: 27;
    FixComments             :: 28;
    FixUri                  :: 29;
    ForceOutput             :: 30;
    GDocClean               :: 31;
    HideComments            :: 32;
    HtmlOut                 :: 33;
    InCharEncoding          :: 34;
    IndentAttributes        :: 35;
    IndentCdata             :: 36;
    IndentContent           :: 37;
    IndentSpaces            :: 38;
    InlineTags              :: 39;
    JoinClasses             :: 40;
    JoinStyles              :: 41;
    KeepFileTimes           :: 42;
    KeepTabs                :: 43;
    LiteralAttribs          :: 44;
    LogicalEmphasis         :: 45;
    LowerLiterals           :: 46;
    MakeBare                :: 47;
    MakeClean               :: 48;
    Mark                    :: 49;
    MergeDivs               :: 50;
    MergeEmphasis           :: 51;
    MergeSpans              :: 52;
    MetaCharset             :: 53;
    MuteReports             :: 54;
    MuteShow                :: 55;
    NCR                     :: 56;
    Newline                 :: 57;
    NumEntities             :: 58;
    OmitOptionalTags        :: 59;
    OutCharEncoding         :: 60;
    OutFile                 :: 61;
    OutputBOM               :: 62;
    PPrintTabs              :: 63;
    PreserveEntities        :: 64;
    PreTags                 :: 65;
    PriorityAttributes      :: 66;
    PunctWrap               :: 67;
    Quiet                   :: 68;
    QuoteAmpersand          :: 69;
    QuoteMarks              :: 70;
    QuoteNbsp               :: 71;
    ReplaceColor            :: 72;
    ShowErrors              :: 73;
    ShowFilename            :: 74;
    ShowInfo                :: 75;
    ShowMarkup              :: 76;
    ShowMetaChange          :: 77;
    ShowWarnings            :: 78;
    SkipNested              :: 79;
    SortAttributes          :: 80;
    StrictTagsAttr          :: 81;
    StyleTags               :: 82;
    TabSize                 :: 83;
    UpperCaseAttrs          :: 84;
    UpperCaseTags           :: 85;
    UseCustomTags           :: 86;
    VertSpace               :: 87;
    WarnPropAttrs           :: 88;
    Word2000                :: 89;
    WrapAsp                 :: 90;
    WrapAttVals             :: 91;
    WrapJste                :: 92;
    WrapLen                 :: 93;
    WrapPhp                 :: 94;
    WrapScriptlets          :: 95;
    WrapSection             :: 96;
    WriteBack               :: 97;
    XhtmlOut                :: 98;
    XmlDecl                 :: 99;
    XmlOut                  :: 100;
    XmlPIs                  :: 101;
    XmlSpace                :: 102;
    XmlTags                 :: 103;
    N_TIDY_OPTIONS          :: 104;
}

/** Categories of Tidy configuration options, which are used mostly by user
** interfaces to sort Tidy options into related groups.
**
** @remark These enum members all have associated localized strings available
**         suitable for use as a category label, and are available with either
**         the enum value, or a string version of the name.
**
** @sa     `config.c:option_defs[]` for internal implementation details.
*/
TidyConfigCategory :: enum u32 {
    UnknownCategory  :: 300;
    Diagnostics      :: 301;
    Display          :: 302;
    DocumentIO       :: 303;
    Encoding         :: 304;
    FileIO           :: 305;
    MarkupCleanup    :: 306;
    MarkupEntities   :: 307;
    MarkupRepair     :: 308;
    MarkupTeach      :: 309;
    MarkupXForm      :: 310;
    PrettyPrint      :: 311;
    InternalCategory :: 312;
}

/** A Tidy configuration option can have one of these data types. */
TidyOptionType :: enum u32 {
    String  :: 0;
    Integer :: 1;
    Boolean :: 2;
}

/** AutoBool values used by ParseBool, ParseTriState, ParseIndent, ParseBOM
** @remark This enum's starting value is guaranteed to remain stable.
*/
TidyTriState :: enum u32 {
    NoState   :: 0;
    YesState  :: 1;
    AutoState :: 2;
}

/** Values used by ParseUseCustomTags, which describes how Autonomous Custom
** tags (ACT's) found by Tidy are treated.
**
** @remark These enum members all have associated localized strings available
**         for internal LibTidy use, and also have public string keys in the
**         form MEMBER_STRING, e.g., TIDYCUSTOMBLOCKLEVEL_STRING
**
** @remark This enum's starting value is guaranteed to remain stable.
*/
TidyUseCustomTagsState :: enum u32 {
    No         :: 0;
    Blocklevel :: 1;
    Empty      :: 2;
    Inline     :: 3;
    Pre        :: 4;
}

/** TidyNewline option values to control output line endings.
** @remark This enum's starting value is guaranteed to remain stable.
*/
TidyLineEnding :: enum u32 {
    LF   :: 0;
    CRLF :: 1;
    CR   :: 2;
}

/** TidyEncodingOptions option values specify the input and/or output encoding.
** @remark This enum's starting value is guaranteed to remain stable.
*/
TidyEncodingOptions :: enum u32 {
    Raw      :: 0;
    Ascii    :: 1;
    Latin0   :: 2;
    Latin1   :: 3;
    Utf8     :: 4;

    Iso2022  :: 5;

    Mac      :: 6;
    Win1252  :: 7;
    Ibm858   :: 8;
    Utf16le  :: 9;
    Utf16be  :: 10;
    Utf16    :: 11;
    Big5     :: 12;
    Shiftjis :: 13;
}

/** Mode controlling treatment of doctype
** @remark This enum's starting value is guaranteed to remain stable.
*/
TidyDoctypeModes :: enum u32 {
    Html5  :: 0;
    Omit   :: 1;
    Auto   :: 2;
    Strict :: 3;
    Loose  :: 4;
    User   :: 5;
}

/** Mode controlling treatment of duplicate Attributes
** @remark This enum's starting value is guaranteed to remain stable.
*/
TidyDupAttrModes :: enum u32 {
    First :: 0;
    Last  :: 1;
}

/** Mode controlling treatment of sorting attributes
** @remark This enum's starting value is guaranteed to remain stable.
*/
TidyAttrSortStrategy :: enum u32 {
    None  :: 0;
    Alpha :: 1;
}

/** Mode controlling capitalization of things, such as attributes.
** @remark This enum's starting value is guaranteed to remain stable.
*/
TidyUppercase :: enum u32 {
    No       :: 0;
    Yes      :: 1;
    Preserve :: 2;
}

/** Node types
*/
TidyNodeType :: enum u32 {
    Root     :: 0;
    DocType  :: 1;
    Comment  :: 2;
    ProcIns  :: 3;
    Text     :: 4;
    Start    :: 5;
    End      :: 6;
    StartEnd :: 7;
    CDATA    :: 8;
    Section  :: 9;
    Asp      :: 10;
    Jste     :: 11;
    Php      :: 12;
    XmlDecl  :: 13;
}

/** Known HTML element types
*/
TidyTagId :: enum u32 {
    TidyTag_UNKNOWN    :: 0;
    TidyTag_A          :: 1;
    TidyTag_ABBR       :: 2;
    TidyTag_ACRONYM    :: 3;
    TidyTag_ADDRESS    :: 4;
    TidyTag_ALIGN      :: 5;
    TidyTag_APPLET     :: 6;
    TidyTag_AREA       :: 7;
    TidyTag_B          :: 8;
    TidyTag_BASE       :: 9;
    TidyTag_BASEFONT   :: 10;
    TidyTag_BDO        :: 11;
    TidyTag_BGSOUND    :: 12;
    TidyTag_BIG        :: 13;
    TidyTag_BLINK      :: 14;
    TidyTag_BLOCKQUOTE :: 15;
    TidyTag_BODY       :: 16;
    TidyTag_BR         :: 17;
    TidyTag_BUTTON     :: 18;
    TidyTag_CAPTION    :: 19;
    TidyTag_CENTER     :: 20;
    TidyTag_CITE       :: 21;
    TidyTag_CODE       :: 22;
    TidyTag_COL        :: 23;
    TidyTag_COLGROUP   :: 24;
    TidyTag_COMMENT    :: 25;
    TidyTag_DD         :: 26;
    TidyTag_DEL        :: 27;
    TidyTag_DFN        :: 28;
    TidyTag_DIR        :: 29;
    TidyTag_DIV        :: 30;
    TidyTag_DL         :: 31;
    TidyTag_DT         :: 32;
    TidyTag_EM         :: 33;
    TidyTag_EMBED      :: 34;
    TidyTag_FIELDSET   :: 35;
    TidyTag_FONT       :: 36;
    TidyTag_FORM       :: 37;
    TidyTag_FRAME      :: 38;
    TidyTag_FRAMESET   :: 39;
    TidyTag_H1         :: 40;
    TidyTag_H2         :: 41;
    TidyTag_H3         :: 42;
    TidyTag_H4         :: 43;
    TidyTag_H5         :: 44;
    TidyTag_H6         :: 45;
    TidyTag_HEAD       :: 46;
    TidyTag_HR         :: 47;
    TidyTag_HTML       :: 48;
    TidyTag_I          :: 49;
    TidyTag_IFRAME     :: 50;
    TidyTag_ILAYER     :: 51;
    TidyTag_IMG        :: 52;
    TidyTag_INPUT      :: 53;
    TidyTag_INS        :: 54;
    TidyTag_ISINDEX    :: 55;
    TidyTag_KBD        :: 56;
    TidyTag_KEYGEN     :: 57;
    TidyTag_LABEL      :: 58;
    TidyTag_LAYER      :: 59;
    TidyTag_LEGEND     :: 60;
    TidyTag_LI         :: 61;
    TidyTag_LINK       :: 62;
    TidyTag_LISTING    :: 63;
    TidyTag_MAP        :: 64;
    TidyTag_MATHML     :: 65;
    TidyTag_MARQUEE    :: 66;
    TidyTag_MENU       :: 67;
    TidyTag_META       :: 68;
    TidyTag_MULTICOL   :: 69;
    TidyTag_NOBR       :: 70;
    TidyTag_NOEMBED    :: 71;
    TidyTag_NOFRAMES   :: 72;
    TidyTag_NOLAYER    :: 73;
    TidyTag_NOSAVE     :: 74;
    TidyTag_NOSCRIPT   :: 75;
    TidyTag_OBJECT     :: 76;
    TidyTag_OL         :: 77;
    TidyTag_OPTGROUP   :: 78;
    TidyTag_OPTION     :: 79;
    TidyTag_P          :: 80;
    TidyTag_PARAM      :: 81;
    TidyTag_PICTURE    :: 82;
    TidyTag_PLAINTEXT  :: 83;
    TidyTag_PRE        :: 84;
    TidyTag_Q          :: 85;
    TidyTag_RB         :: 86;
    TidyTag_RBC        :: 87;
    TidyTag_RP         :: 88;
    TidyTag_RT         :: 89;
    TidyTag_RTC        :: 90;
    TidyTag_RUBY       :: 91;
    TidyTag_S          :: 92;
    TidyTag_SAMP       :: 93;
    TidyTag_SCRIPT     :: 94;
    TidyTag_SELECT     :: 95;
    TidyTag_SERVER     :: 96;
    TidyTag_SERVLET    :: 97;
    TidyTag_SMALL      :: 98;
    TidyTag_SPACER     :: 99;
    TidyTag_SPAN       :: 100;
    TidyTag_STRIKE     :: 101;
    TidyTag_STRONG     :: 102;
    TidyTag_STYLE      :: 103;
    TidyTag_SUB        :: 104;
    TidyTag_SUP        :: 105;
    TidyTag_SVG        :: 106;
    TidyTag_TABLE      :: 107;
    TidyTag_TBODY      :: 108;
    TidyTag_TD         :: 109;
    TidyTag_TEXTAREA   :: 110;
    TidyTag_TFOOT      :: 111;
    TidyTag_TH         :: 112;
    TidyTag_THEAD      :: 113;
    TidyTag_TITLE      :: 114;
    TidyTag_TR         :: 115;
    TidyTag_TT         :: 116;
    TidyTag_U          :: 117;
    TidyTag_UL         :: 118;
    TidyTag_VAR        :: 119;
    TidyTag_WBR        :: 120;
    TidyTag_XMP        :: 121;
    TidyTag_NEXTID     :: 122;

    TidyTag_ARTICLE    :: 123;
    TidyTag_ASIDE      :: 124;
    TidyTag_AUDIO      :: 125;
    TidyTag_BDI        :: 126;
    TidyTag_CANVAS     :: 127;
    TidyTag_COMMAND    :: 128;
    TidyTag_DATA       :: 129;
    TidyTag_DATALIST   :: 130;
    TidyTag_DETAILS    :: 131;
    TidyTag_DIALOG     :: 132;
    TidyTag_FIGCAPTION :: 133;
    TidyTag_FIGURE     :: 134;
    TidyTag_FOOTER     :: 135;
    TidyTag_HEADER     :: 136;
    TidyTag_HGROUP     :: 137;
    TidyTag_MAIN       :: 138;
    TidyTag_MARK       :: 139;
    TidyTag_MENUITEM   :: 140;
    TidyTag_METER      :: 141;
    TidyTag_NAV        :: 142;
    TidyTag_OUTPUT     :: 143;
    TidyTag_PROGRESS   :: 144;
    TidyTag_SECTION    :: 145;
    TidyTag_SOURCE     :: 146;
    TidyTag_SUMMARY    :: 147;
    TidyTag_TEMPLATE   :: 148;
    TidyTag_TIME       :: 149;
    TidyTag_TRACK      :: 150;
    TidyTag_VIDEO      :: 151;
    TidyTag_SLOT       :: 152;

    N_TIDY_TAGS        :: 153;
}

/** Known HTML attributes
*/
TidyAttrId :: enum u32 {
    TidyAttr_UNKNOWN               :: 0;
    TidyAttr_ABBR                  :: 1;
    TidyAttr_ACCEPT                :: 2;
    TidyAttr_ACCEPT_CHARSET        :: 3;
    TidyAttr_ACCESSKEY             :: 4;
    TidyAttr_ACTION                :: 5;
    TidyAttr_ADD_DATE              :: 6;
    TidyAttr_ALIGN                 :: 7;
    TidyAttr_ALINK                 :: 8;
    TidyAttr_ALLOWFULLSCREEN       :: 9;
    TidyAttr_ALT                   :: 10;
    TidyAttr_ARCHIVE               :: 11;
    TidyAttr_AXIS                  :: 12;
    TidyAttr_BACKGROUND            :: 13;
    TidyAttr_BGCOLOR               :: 14;
    TidyAttr_BGPROPERTIES          :: 15;
    TidyAttr_BORDER                :: 16;
    TidyAttr_BORDERCOLOR           :: 17;
    TidyAttr_BOTTOMMARGIN          :: 18;
    TidyAttr_CELLPADDING           :: 19;
    TidyAttr_CELLSPACING           :: 20;
    TidyAttr_CHAR                  :: 21;
    TidyAttr_CHAROFF               :: 22;
    TidyAttr_CHARSET               :: 23;
    TidyAttr_CHECKED               :: 24;
    TidyAttr_CITE                  :: 25;
    TidyAttr_CLASS                 :: 26;
    TidyAttr_CLASSID               :: 27;
    TidyAttr_CLEAR                 :: 28;
    TidyAttr_CODE                  :: 29;
    TidyAttr_CODEBASE              :: 30;
    TidyAttr_CODETYPE              :: 31;
    TidyAttr_COLOR                 :: 32;
    TidyAttr_COLS                  :: 33;
    TidyAttr_COLSPAN               :: 34;
    TidyAttr_COMPACT               :: 35;
    TidyAttr_CONTENT               :: 36;
    TidyAttr_COORDS                :: 37;
    TidyAttr_DATA                  :: 38;
    TidyAttr_DATAFLD               :: 39;
    TidyAttr_DATAFORMATAS          :: 40;
    TidyAttr_DATAPAGESIZE          :: 41;
    TidyAttr_DATASRC               :: 42;
    TidyAttr_DATETIME              :: 43;
    TidyAttr_DECLARE               :: 44;
    TidyAttr_DEFER                 :: 45;
    TidyAttr_DIR                   :: 46;
    TidyAttr_DISABLED              :: 47;
    TidyAttr_DOWNLOAD              :: 48;
    TidyAttr_ENCODING              :: 49;
    TidyAttr_ENCTYPE               :: 50;
    TidyAttr_FACE                  :: 51;
    TidyAttr_FOR                   :: 52;
    TidyAttr_FRAME                 :: 53;
    TidyAttr_FRAMEBORDER           :: 54;
    TidyAttr_FRAMESPACING          :: 55;
    TidyAttr_GRIDX                 :: 56;
    TidyAttr_GRIDY                 :: 57;
    TidyAttr_HEADERS               :: 58;
    TidyAttr_HEIGHT                :: 59;
    TidyAttr_HREF                  :: 60;
    TidyAttr_HREFLANG              :: 61;
    TidyAttr_HSPACE                :: 62;
    TidyAttr_HTTP_EQUIV            :: 63;
    TidyAttr_ID                    :: 64;
    TidyAttr_IS                    :: 65;
    TidyAttr_ISMAP                 :: 66;
    TidyAttr_ITEMID                :: 67;
    TidyAttr_ITEMPROP              :: 68;
    TidyAttr_ITEMREF               :: 69;
    TidyAttr_ITEMSCOPE             :: 70;
    TidyAttr_ITEMTYPE              :: 71;
    TidyAttr_LABEL                 :: 72;
    TidyAttr_LANG                  :: 73;
    TidyAttr_LANGUAGE              :: 74;
    TidyAttr_LAST_MODIFIED         :: 75;
    TidyAttr_LAST_VISIT            :: 76;
    TidyAttr_LEFTMARGIN            :: 77;
    TidyAttr_LINK                  :: 78;
    TidyAttr_LONGDESC              :: 79;
    TidyAttr_LOWSRC                :: 80;
    TidyAttr_MARGINHEIGHT          :: 81;
    TidyAttr_MARGINWIDTH           :: 82;
    TidyAttr_MAXLENGTH             :: 83;
    TidyAttr_MEDIA                 :: 84;
    TidyAttr_METHOD                :: 85;
    TidyAttr_MULTIPLE              :: 86;
    TidyAttr_NAME                  :: 87;
    TidyAttr_NOHREF                :: 88;
    TidyAttr_NORESIZE              :: 89;
    TidyAttr_NOSHADE               :: 90;
    TidyAttr_NOWRAP                :: 91;
    TidyAttr_OBJECT                :: 92;
    TidyAttr_OnAFTERUPDATE         :: 93;
    TidyAttr_OnBEFOREUNLOAD        :: 94;
    TidyAttr_OnBEFOREUPDATE        :: 95;
    TidyAttr_OnBLUR                :: 96;
    TidyAttr_OnCHANGE              :: 97;
    TidyAttr_OnCLICK               :: 98;
    TidyAttr_OnDATAAVAILABLE       :: 99;
    TidyAttr_OnDATASETCHANGED      :: 100;
    TidyAttr_OnDATASETCOMPLETE     :: 101;
    TidyAttr_OnDBLCLICK            :: 102;
    TidyAttr_OnERRORUPDATE         :: 103;
    TidyAttr_OnFOCUS               :: 104;
    TidyAttr_OnKEYDOWN             :: 105;
    TidyAttr_OnKEYPRESS            :: 106;
    TidyAttr_OnKEYUP               :: 107;
    TidyAttr_OnLOAD                :: 108;
    TidyAttr_OnMOUSEDOWN           :: 109;
    TidyAttr_OnMOUSEMOVE           :: 110;
    TidyAttr_OnMOUSEOUT            :: 111;
    TidyAttr_OnMOUSEOVER           :: 112;
    TidyAttr_OnMOUSEUP             :: 113;
    TidyAttr_OnRESET               :: 114;
    TidyAttr_OnROWENTER            :: 115;
    TidyAttr_OnROWEXIT             :: 116;
    TidyAttr_OnSELECT              :: 117;
    TidyAttr_OnSUBMIT              :: 118;
    TidyAttr_OnUNLOAD              :: 119;
    TidyAttr_PROFILE               :: 120;
    TidyAttr_PROMPT                :: 121;
    TidyAttr_RBSPAN                :: 122;
    TidyAttr_READONLY              :: 123;
    TidyAttr_REL                   :: 124;
    TidyAttr_REV                   :: 125;
    TidyAttr_RIGHTMARGIN           :: 126;
    TidyAttr_ROLE                  :: 127;
    TidyAttr_ROWS                  :: 128;
    TidyAttr_ROWSPAN               :: 129;
    TidyAttr_RULES                 :: 130;
    TidyAttr_SCHEME                :: 131;
    TidyAttr_SCOPE                 :: 132;
    TidyAttr_SCROLLING             :: 133;
    TidyAttr_SELECTED              :: 134;
    TidyAttr_SHAPE                 :: 135;
    TidyAttr_SHOWGRID              :: 136;
    TidyAttr_SHOWGRIDX             :: 137;
    TidyAttr_SHOWGRIDY             :: 138;
    TidyAttr_SIZE                  :: 139;
    TidyAttr_SPAN                  :: 140;
    TidyAttr_SRC                   :: 141;
    TidyAttr_SRCSET                :: 142;
    TidyAttr_STANDBY               :: 143;
    TidyAttr_START                 :: 144;
    TidyAttr_STYLE                 :: 145;
    TidyAttr_SUMMARY               :: 146;
    TidyAttr_TABINDEX              :: 147;
    TidyAttr_TARGET                :: 148;
    TidyAttr_TEXT                  :: 149;
    TidyAttr_TITLE                 :: 150;
    TidyAttr_TOPMARGIN             :: 151;
    TidyAttr_TRANSLATE             :: 152;
    TidyAttr_TYPE                  :: 153;
    TidyAttr_USEMAP                :: 154;
    TidyAttr_VALIGN                :: 155;
    TidyAttr_VALUE                 :: 156;
    TidyAttr_VALUETYPE             :: 157;
    TidyAttr_VERSION               :: 158;
    TidyAttr_VLINK                 :: 159;
    TidyAttr_VSPACE                :: 160;
    TidyAttr_WIDTH                 :: 161;
    TidyAttr_WRAP                  :: 162;
    TidyAttr_XML_LANG              :: 163;
    TidyAttr_XML_SPACE             :: 164;
    TidyAttr_XMLNS                 :: 165;

    TidyAttr_EVENT                 :: 166;
    TidyAttr_METHODS               :: 167;
    TidyAttr_N                     :: 168;
    TidyAttr_SDAFORM               :: 169;
    TidyAttr_SDAPREF               :: 170;
    TidyAttr_SDASUFF               :: 171;
    TidyAttr_URN                   :: 172;

    TidyAttr_ASYNC                 :: 173;
    TidyAttr_AUTOCOMPLETE          :: 174;
    TidyAttr_AUTOFOCUS             :: 175;
    TidyAttr_AUTOPLAY              :: 176;
    TidyAttr_CHALLENGE             :: 177;
    TidyAttr_CONTENTEDITABLE       :: 178;
    TidyAttr_CONTEXTMENU           :: 179;
    TidyAttr_CONTROLS              :: 180;
    TidyAttr_CROSSORIGIN           :: 181;
    TidyAttr_DEFAULT               :: 182;
    TidyAttr_DIRNAME               :: 183;
    TidyAttr_DRAGGABLE             :: 184;
    TidyAttr_DROPZONE              :: 185;
    TidyAttr_FORM                  :: 186;
    TidyAttr_FORMACTION            :: 187;
    TidyAttr_FORMENCTYPE           :: 188;
    TidyAttr_FORMMETHOD            :: 189;
    TidyAttr_FORMNOVALIDATE        :: 190;
    TidyAttr_FORMTARGET            :: 191;
    TidyAttr_HIDDEN                :: 192;
    TidyAttr_HIGH                  :: 193;
    TidyAttr_ICON                  :: 194;
    TidyAttr_KEYTYPE               :: 195;
    TidyAttr_KIND                  :: 196;
    TidyAttr_LIST                  :: 197;
    TidyAttr_LOOP                  :: 198;
    TidyAttr_LOW                   :: 199;
    TidyAttr_MANIFEST              :: 200;
    TidyAttr_MAX                   :: 201;
    TidyAttr_MEDIAGROUP            :: 202;
    TidyAttr_MIN                   :: 203;
    TidyAttr_MUTED                 :: 204;
    TidyAttr_NOVALIDATE            :: 205;
    TidyAttr_OPEN                  :: 206;
    TidyAttr_OPTIMUM               :: 207;
    TidyAttr_OnABORT               :: 208;
    TidyAttr_OnAFTERPRINT          :: 209;
    TidyAttr_OnBEFOREPRINT         :: 210;
    TidyAttr_OnCANPLAY             :: 211;
    TidyAttr_OnCANPLAYTHROUGH      :: 212;
    TidyAttr_OnCONTEXTMENU         :: 213;
    TidyAttr_OnCUECHANGE           :: 214;
    TidyAttr_OnDRAG                :: 215;
    TidyAttr_OnDRAGEND             :: 216;
    TidyAttr_OnDRAGENTER           :: 217;
    TidyAttr_OnDRAGLEAVE           :: 218;
    TidyAttr_OnDRAGOVER            :: 219;
    TidyAttr_OnDRAGSTART           :: 220;
    TidyAttr_OnDROP                :: 221;
    TidyAttr_OnDURATIONCHANGE      :: 222;
    TidyAttr_OnEMPTIED             :: 223;
    TidyAttr_OnENDED               :: 224;
    TidyAttr_OnERROR               :: 225;
    TidyAttr_OnHASHCHANGE          :: 226;
    TidyAttr_OnINPUT               :: 227;
    TidyAttr_OnINVALID             :: 228;
    TidyAttr_OnLOADEDDATA          :: 229;
    TidyAttr_OnLOADEDMETADATA      :: 230;
    TidyAttr_OnLOADSTART           :: 231;
    TidyAttr_OnMESSAGE             :: 232;
    TidyAttr_OnMOUSEWHEEL          :: 233;
    TidyAttr_OnOFFLINE             :: 234;
    TidyAttr_OnONLINE              :: 235;
    TidyAttr_OnPAGEHIDE            :: 236;
    TidyAttr_OnPAGESHOW            :: 237;
    TidyAttr_OnPAUSE               :: 238;
    TidyAttr_OnPLAY                :: 239;
    TidyAttr_OnPLAYING             :: 240;
    TidyAttr_OnPOPSTATE            :: 241;
    TidyAttr_OnPROGRESS            :: 242;
    TidyAttr_OnRATECHANGE          :: 243;
    TidyAttr_OnREADYSTATECHANGE    :: 244;
    TidyAttr_OnREDO                :: 245;
    TidyAttr_OnRESIZE              :: 246;
    TidyAttr_OnSCROLL              :: 247;
    TidyAttr_OnSEEKED              :: 248;
    TidyAttr_OnSEEKING             :: 249;
    TidyAttr_OnSHOW                :: 250;
    TidyAttr_OnSTALLED             :: 251;
    TidyAttr_OnSTORAGE             :: 252;
    TidyAttr_OnSUSPEND             :: 253;
    TidyAttr_OnTIMEUPDATE          :: 254;
    TidyAttr_OnUNDO                :: 255;
    TidyAttr_OnVOLUMECHANGE        :: 256;
    TidyAttr_OnWAITING             :: 257;
    TidyAttr_PATTERN               :: 258;
    TidyAttr_PLACEHOLDER           :: 259;
    TidyAttr_PLAYSINLINE           :: 260;
    TidyAttr_POSTER                :: 261;
    TidyAttr_PRELOAD               :: 262;
    TidyAttr_PUBDATE               :: 263;
    TidyAttr_RADIOGROUP            :: 264;
    TidyAttr_REQUIRED              :: 265;
    TidyAttr_REVERSED              :: 266;
    TidyAttr_SANDBOX               :: 267;
    TidyAttr_SCOPED                :: 268;
    TidyAttr_SEAMLESS              :: 269;
    TidyAttr_SIZES                 :: 270;
    TidyAttr_SPELLCHECK            :: 271;
    TidyAttr_SRCDOC                :: 272;
    TidyAttr_SRCLANG               :: 273;
    TidyAttr_STEP                  :: 274;
    TidyAttr_ARIA_ACTIVEDESCENDANT :: 275;
    TidyAttr_ARIA_ATOMIC           :: 276;
    TidyAttr_ARIA_AUTOCOMPLETE     :: 277;
    TidyAttr_ARIA_BUSY             :: 278;
    TidyAttr_ARIA_CHECKED          :: 279;
    TidyAttr_ARIA_CONTROLS         :: 280;
    TidyAttr_ARIA_DESCRIBEDBY      :: 281;
    TidyAttr_ARIA_DISABLED         :: 282;
    TidyAttr_ARIA_DROPEFFECT       :: 283;
    TidyAttr_ARIA_EXPANDED         :: 284;
    TidyAttr_ARIA_FLOWTO           :: 285;
    TidyAttr_ARIA_GRABBED          :: 286;
    TidyAttr_ARIA_HASPOPUP         :: 287;
    TidyAttr_ARIA_HIDDEN           :: 288;
    TidyAttr_ARIA_INVALID          :: 289;
    TidyAttr_ARIA_LABEL            :: 290;
    TidyAttr_ARIA_LABELLEDBY       :: 291;
    TidyAttr_ARIA_LEVEL            :: 292;
    TidyAttr_ARIA_LIVE             :: 293;
    TidyAttr_ARIA_MULTILINE        :: 294;
    TidyAttr_ARIA_MULTISELECTABLE  :: 295;
    TidyAttr_ARIA_ORIENTATION      :: 296;
    TidyAttr_ARIA_OWNS             :: 297;
    TidyAttr_ARIA_POSINSET         :: 298;
    TidyAttr_ARIA_PRESSED          :: 299;
    TidyAttr_ARIA_READONLY         :: 300;
    TidyAttr_ARIA_RELEVANT         :: 301;
    TidyAttr_ARIA_REQUIRED         :: 302;
    TidyAttr_ARIA_SELECTED         :: 303;
    TidyAttr_ARIA_SETSIZE          :: 304;
    TidyAttr_ARIA_SORT             :: 305;
    TidyAttr_ARIA_VALUEMAX         :: 306;
    TidyAttr_ARIA_VALUEMIN         :: 307;
    TidyAttr_ARIA_VALUENOW         :: 308;
    TidyAttr_ARIA_VALUETEXT        :: 309;

    TidyAttr_X                     :: 310;
    TidyAttr_Y                     :: 311;
    TidyAttr_VIEWBOX               :: 312;
    TidyAttr_PRESERVEASPECTRATIO   :: 313;
    TidyAttr_ZOOMANDPAN            :: 314;
    TidyAttr_BASEPROFILE           :: 315;
    TidyAttr_CONTENTSCRIPTTYPE     :: 316;
    TidyAttr_CONTENTSTYLETYPE      :: 317;

    TidyAttr_DISPLAY               :: 318;

    TidyAttr_ABOUT                 :: 319;
    TidyAttr_DATATYPE              :: 320;
    TidyAttr_INLIST                :: 321;
    TidyAttr_PREFIX                :: 322;
    TidyAttr_PROPERTY              :: 323;
    TidyAttr_RESOURCE              :: 324;
    TidyAttr_TYPEOF                :: 325;
    TidyAttr_VOCAB                 :: 326;

    TidyAttr_INTEGRITY             :: 327;

    TidyAttr_AS                    :: 328;

    TidyAttr_XMLNSXLINK            :: 329;
    TidyAttr_SLOT                  :: 330;
    TidyAttr_LOADING               :: 331;

    TidyAttr_FILL                  :: 332;
    TidyAttr_FILLRULE              :: 333;
    TidyAttr_STROKE                :: 334;
    TidyAttr_STROKEDASHARRAY       :: 335;
    TidyAttr_STROKEDASHOFFSET      :: 336;
    TidyAttr_STROKELINECAP         :: 337;
    TidyAttr_STROKELINEJOIN        :: 338;
    TidyAttr_STROKEMITERLIMIT      :: 339;
    TidyAttr_STROKEWIDTH           :: 340;
    TidyAttr_COLORINTERPOLATION    :: 341;
    TidyAttr_COLORRENDERING        :: 342;
    TidyAttr_OPACITY               :: 343;
    TidyAttr_STROKEOPACITY         :: 344;
    TidyAttr_FILLOPACITY           :: 345;

    N_TIDY_ATTRIBS                 :: 346;
}

/** Message severity level, used throughout LibTidy to indicate the severity
** or status of a message
**
** @remark These enum members all have associated localized strings available
**         via their enum values. These strings are suitable for use as labels.
*/
TidyReportLevel :: enum u32 {
    Info             :: 350;
    Warning          :: 351;
    Config           :: 352;
    Access           :: 353;
    Error            :: 354;
    BadDocument      :: 355;
    Fatal            :: 356;
    DialogueSummary  :: 357;
    DialogueInfo     :: 358;
    DialogueFootnote :: 359;
    DialogueDoc      :: 359;
}

/** Indicates the data type of a format string parameter used when Tidy
** emits reports and dialogue as part of the messaging callback functions.
** See `messageobj.h` for more information on this API.
*/
TidyFormatParameterType :: enum u32 {
    INT     :: 0;
    UINT    :: 1;
    STRING  :: 2;
    DOUBLE  :: 3;
    UNKNOWN :: 20;
}

/** The enumeration contains a list of every possible string that Tidy and the
** console application can output, _except_ for strings from the following
** enumerations:
** - `TidyOptionId`
** - `TidyConfigCategory`
** - `TidyReportLevel`
**
** They are used as keys internally within Tidy, and have corresponding text
** keys that are used in message callback filters (these are defined in
** `tidyStringsKeys[]`, but API users don't require access to it directly).
*/
tidyStrings :: enum u32 {
    TIDYSTRINGS_FIRST                             :: 500;

    LINE_COLUMN_STRING                            :: 501;
    FN_LINE_COLUMN_STRING                         :: 502;
    STRING_DISCARDING                             :: 503;
    STRING_ERROR_COUNT_ERROR                      :: 504;
    STRING_ERROR_COUNT_WARNING                    :: 505;
    STRING_HELLO_ACCESS                           :: 506;
    STRING_HTML_PROPRIETARY                       :: 507;
    STRING_PLAIN_TEXT                             :: 508;
    STRING_REPLACING                              :: 509;
    STRING_SPECIFIED                              :: 510;
    STRING_XML_DECLARATION                        :: 511;
    TIDYCUSTOMNO_STRING                           :: 512;
    TIDYCUSTOMBLOCKLEVEL_STRING                   :: 513;
    TIDYCUSTOMEMPTY_STRING                        :: 514;
    TIDYCUSTOMINLINE_STRING                       :: 515;
    TIDYCUSTOMPRE_STRING                          :: 516;
    FOOTNOTE_TRIM_EMPTY_ELEMENT                   :: 517;
    TEXT_ACCESS_ADVICE1                           :: 518;
    TEXT_ACCESS_ADVICE2                           :: 519;
    TEXT_BAD_FORM                                 :: 520;
    TEXT_BAD_MAIN                                 :: 521;
    TEXT_HTML_T_ALGORITHM                         :: 522;
    TEXT_INVALID_URI                              :: 523;
    TEXT_INVALID_UTF16                            :: 524;
    TEXT_INVALID_UTF8                             :: 525;
    TEXT_M_IMAGE_ALT                              :: 526;
    TEXT_M_IMAGE_MAP                              :: 527;
    TEXT_M_LINK_ALT                               :: 528;
    TEXT_M_SUMMARY                                :: 529;
    TEXT_SGML_CHARS                               :: 530;
    TEXT_USING_BODY                               :: 531;
    TEXT_USING_FONT                               :: 532;
    TEXT_USING_FRAMES                             :: 533;
    TEXT_USING_LAYER                              :: 534;
    TEXT_USING_NOBR                               :: 535;
    TEXT_USING_SPACER                             :: 536;
    TEXT_VENDOR_CHARS                             :: 537;
    TEXT_WINDOWS_CHARS                            :: 538;
    STRING_ERROR_COUNT                            :: 539;
    STRING_NEEDS_INTERVENTION                     :: 540;
    STRING_NO_ERRORS                              :: 541;
    STRING_NOT_ALL_SHOWN                          :: 542;
    TEXT_GENERAL_INFO_PLEA                        :: 543;
    TEXT_GENERAL_INFO                             :: 544;
    REPORT_MESSAGE_FIRST                          :: 545;
    ADDED_MISSING_CHARSET                         :: 546;
    ANCHOR_NOT_UNIQUE                             :: 547;
    ANCHOR_DUPLICATED                             :: 548;
    APOS_UNDEFINED                                :: 549;
    ATTR_VALUE_NOT_LCASE                          :: 550;
    ATTRIBUTE_IS_NOT_ALLOWED                      :: 551;
    ATTRIBUTE_VALUE_REPLACED                      :: 552;
    BACKSLASH_IN_URI                              :: 553;
    BAD_ATTRIBUTE_VALUE_REPLACED                  :: 554;
    BAD_ATTRIBUTE_VALUE                           :: 555;
    BAD_CDATA_CONTENT                             :: 556;
    BAD_SUMMARY_HTML5                             :: 557;
    BAD_SURROGATE_LEAD                            :: 558;
    BAD_SURROGATE_PAIR                            :: 559;
    BAD_SURROGATE_TAIL                            :: 560;
    CANT_BE_NESTED                                :: 561;
    COERCE_TO_ENDTAG                              :: 562;
    CONTENT_AFTER_BODY                            :: 563;
    CUSTOM_TAG_DETECTED                           :: 564;
    DISCARDING_UNEXPECTED                         :: 565;
    DOCTYPE_AFTER_TAGS                            :: 566;
    DUPLICATE_FRAMESET                            :: 567;
    ELEMENT_NOT_EMPTY                             :: 568;
    ELEMENT_VERS_MISMATCH_ERROR                   :: 569;
    ELEMENT_VERS_MISMATCH_WARN                    :: 570;
    ENCODING_MISMATCH                             :: 571;
    ESCAPED_ILLEGAL_URI                           :: 572;
    FILE_CANT_OPEN                                :: 573;
    FILE_CANT_OPEN_CFG                            :: 574;
    FILE_NOT_FILE                                 :: 575;
    FIXED_BACKSLASH                               :: 576;
    FOUND_STYLE_IN_BODY                           :: 577;
    ID_NAME_MISMATCH                              :: 578;
    ILLEGAL_NESTING                               :: 579;
    ILLEGAL_URI_CODEPOINT                         :: 580;
    ILLEGAL_URI_REFERENCE                         :: 581;
    INSERTING_AUTO_ATTRIBUTE                      :: 582;
    INSERTING_TAG                                 :: 583;
    INVALID_ATTRIBUTE                             :: 584;
    INVALID_NCR                                   :: 585;
    INVALID_SGML_CHARS                            :: 586;
    INVALID_UTF8                                  :: 587;
    INVALID_UTF16                                 :: 588;
    INVALID_XML_ID                                :: 589;
    JOINING_ATTRIBUTE                             :: 590;
    MALFORMED_COMMENT                             :: 591;
    MALFORMED_COMMENT_DROPPING                    :: 592;
    MALFORMED_COMMENT_EOS                         :: 593;
    MALFORMED_COMMENT_WARN                        :: 594;
    MALFORMED_DOCTYPE                             :: 595;
    MISMATCHED_ATTRIBUTE_ERROR                    :: 596;
    MISMATCHED_ATTRIBUTE_WARN                     :: 597;
    MISSING_ATTR_VALUE                            :: 598;
    MISSING_ATTRIBUTE                             :: 599;
    MISSING_DOCTYPE                               :: 600;
    MISSING_ENDTAG_BEFORE                         :: 601;
    MISSING_ENDTAG_FOR                            :: 602;
    MISSING_ENDTAG_OPTIONAL                       :: 603;
    MISSING_IMAGEMAP                              :: 604;
    MISSING_QUOTEMARK                             :: 605;
    MISSING_QUOTEMARK_OPEN                        :: 606;
    MISSING_SEMICOLON_NCR                         :: 607;
    MISSING_SEMICOLON                             :: 608;
    MISSING_STARTTAG                              :: 609;
    MISSING_TITLE_ELEMENT                         :: 610;
    MOVED_STYLE_TO_HEAD                           :: 611;
    NESTED_EMPHASIS                               :: 612;
    NESTED_QUOTATION                              :: 613;
    NEWLINE_IN_URI                                :: 614;
    NOFRAMES_CONTENT                              :: 615;
    NON_MATCHING_ENDTAG                           :: 616;
    OBSOLETE_ELEMENT                              :: 617;
    OPTION_REMOVED                                :: 618;
    OPTION_REMOVED_APPLIED                        :: 619;
    OPTION_REMOVED_UNAPPLIED                      :: 620;
    PREVIOUS_LOCATION                             :: 621;
    PROPRIETARY_ATTR_VALUE                        :: 622;
    PROPRIETARY_ATTRIBUTE                         :: 623;
    PROPRIETARY_ELEMENT                           :: 624;
    REMOVED_HTML5                                 :: 625;
    REPEATED_ATTRIBUTE                            :: 626;
    REPLACING_ELEMENT                             :: 627;
    REPLACING_UNEX_ELEMENT                        :: 628;
    SPACE_PRECEDING_XMLDECL                       :: 629;
    STRING_CONTENT_LOOKS                          :: 630;
    STRING_ARGUMENT_BAD                           :: 631;
    STRING_DOCTYPE_GIVEN                          :: 632;
    STRING_MISSING_MALFORMED                      :: 633;
    STRING_MUTING_TYPE                            :: 634;
    STRING_NO_SYSID                               :: 635;
    STRING_UNKNOWN_OPTION                         :: 636;
    SUSPECTED_MISSING_QUOTE                       :: 637;
    TAG_NOT_ALLOWED_IN                            :: 638;
    TOO_MANY_ELEMENTS_IN                          :: 639;
    TOO_MANY_ELEMENTS                             :: 640;
    TRIM_EMPTY_ELEMENT                            :: 641;
    UNESCAPED_AMPERSAND                           :: 642;
    UNEXPECTED_END_OF_FILE_ATTR                   :: 643;
    UNEXPECTED_END_OF_FILE                        :: 644;
    UNEXPECTED_ENDTAG_ERR                         :: 645;
    UNEXPECTED_ENDTAG_IN                          :: 646;
    UNEXPECTED_ENDTAG                             :: 647;
    UNEXPECTED_EQUALSIGN                          :: 648;
    UNEXPECTED_GT                                 :: 649;
    UNEXPECTED_QUOTEMARK                          :: 650;
    UNKNOWN_ELEMENT_LOOKS_CUSTOM                  :: 651;
    UNKNOWN_ELEMENT                               :: 652;
    UNKNOWN_ENTITY                                :: 653;
    USING_BR_INPLACE_OF                           :: 654;
    VENDOR_SPECIFIC_CHARS                         :: 655;
    WHITE_IN_URI                                  :: 656;
    XML_DECLARATION_DETECTED                      :: 657;
    XML_ID_SYNTAX                                 :: 658;
    BLANK_TITLE_ELEMENT                           :: 659;
    REPORT_MESSAGE_LAST                           :: 660;
    IMG_MISSING_ALT                               :: 661;
    IMG_ALT_SUSPICIOUS_FILENAME                   :: 662;
    IMG_ALT_SUSPICIOUS_FILE_SIZE                  :: 663;
    IMG_ALT_SUSPICIOUS_PLACEHOLDER                :: 664;
    IMG_ALT_SUSPICIOUS_TOO_LONG                   :: 665;
    IMG_MISSING_LONGDESC_DLINK                    :: 666;
    IMG_MISSING_DLINK                             :: 667;
    IMG_MISSING_LONGDESC                          :: 668;
    IMG_BUTTON_MISSING_ALT                        :: 669;
    APPLET_MISSING_ALT                            :: 670;
    OBJECT_MISSING_ALT                            :: 671;
    AUDIO_MISSING_TEXT_WAV                        :: 672;
    AUDIO_MISSING_TEXT_AU                         :: 673;
    AUDIO_MISSING_TEXT_AIFF                       :: 674;
    AUDIO_MISSING_TEXT_SND                        :: 675;
    AUDIO_MISSING_TEXT_RA                         :: 676;
    AUDIO_MISSING_TEXT_RM                         :: 677;
    FRAME_MISSING_LONGDESC                        :: 678;
    AREA_MISSING_ALT                              :: 679;
    SCRIPT_MISSING_NOSCRIPT                       :: 680;
    ASCII_REQUIRES_DESCRIPTION                    :: 681;
    IMG_MAP_SERVER_REQUIRES_TEXT_LINKS            :: 682;
    MULTIMEDIA_REQUIRES_TEXT                      :: 683;
    IMG_MAP_CLIENT_MISSING_TEXT_LINKS             :: 684;
    INFORMATION_NOT_CONVEYED_IMAGE                :: 685;
    INFORMATION_NOT_CONVEYED_APPLET               :: 686;
    INFORMATION_NOT_CONVEYED_OBJECT               :: 687;
    INFORMATION_NOT_CONVEYED_SCRIPT               :: 688;
    INFORMATION_NOT_CONVEYED_INPUT                :: 689;
    COLOR_CONTRAST_TEXT                           :: 690;
    COLOR_CONTRAST_LINK                           :: 691;
    COLOR_CONTRAST_ACTIVE_LINK                    :: 692;
    COLOR_CONTRAST_VISITED_LINK                   :: 693;
    DOCTYPE_MISSING                               :: 694;
    STYLE_SHEET_CONTROL_PRESENTATION              :: 695;
    HEADERS_IMPROPERLY_NESTED                     :: 696;
    POTENTIAL_HEADER_BOLD                         :: 697;
    POTENTIAL_HEADER_ITALICS                      :: 698;
    POTENTIAL_HEADER_UNDERLINE                    :: 699;
    HEADER_USED_FORMAT_TEXT                       :: 700;
    LIST_USAGE_INVALID_UL                         :: 701;
    LIST_USAGE_INVALID_OL                         :: 702;
    LIST_USAGE_INVALID_LI                         :: 703;
    LANGUAGE_NOT_IDENTIFIED                       :: 704;
    LANGUAGE_INVALID                              :: 705;
    DATA_TABLE_MISSING_HEADERS                    :: 706;
    DATA_TABLE_MISSING_HEADERS_COLUMN             :: 707;
    DATA_TABLE_MISSING_HEADERS_ROW                :: 708;
    DATA_TABLE_REQUIRE_MARKUP_COLUMN_HEADERS      :: 709;
    DATA_TABLE_REQUIRE_MARKUP_ROW_HEADERS         :: 710;
    LAYOUT_TABLES_LINEARIZE_PROPERLY              :: 711;
    LAYOUT_TABLE_INVALID_MARKUP                   :: 712;
    TABLE_MISSING_SUMMARY                         :: 713;
    TABLE_SUMMARY_INVALID_NULL                    :: 714;
    TABLE_SUMMARY_INVALID_SPACES                  :: 715;
    TABLE_SUMMARY_INVALID_PLACEHOLDER             :: 716;
    TABLE_MISSING_CAPTION                         :: 717;
    TABLE_MAY_REQUIRE_HEADER_ABBR                 :: 718;
    TABLE_MAY_REQUIRE_HEADER_ABBR_NULL            :: 719;
    TABLE_MAY_REQUIRE_HEADER_ABBR_SPACES          :: 720;
    STYLESHEETS_REQUIRE_TESTING_LINK              :: 721;
    STYLESHEETS_REQUIRE_TESTING_STYLE_ELEMENT     :: 722;
    STYLESHEETS_REQUIRE_TESTING_STYLE_ATTR        :: 723;
    FRAME_SRC_INVALID                             :: 724;
    TEXT_EQUIVALENTS_REQUIRE_UPDATING_APPLET      :: 725;
    TEXT_EQUIVALENTS_REQUIRE_UPDATING_SCRIPT      :: 726;
    TEXT_EQUIVALENTS_REQUIRE_UPDATING_OBJECT      :: 727;
    PROGRAMMATIC_OBJECTS_REQUIRE_TESTING_SCRIPT   :: 728;
    PROGRAMMATIC_OBJECTS_REQUIRE_TESTING_OBJECT   :: 729;
    PROGRAMMATIC_OBJECTS_REQUIRE_TESTING_EMBED    :: 730;
    PROGRAMMATIC_OBJECTS_REQUIRE_TESTING_APPLET   :: 731;
    FRAME_MISSING_NOFRAMES                        :: 732;
    NOFRAMES_INVALID_NO_VALUE                     :: 733;
    NOFRAMES_INVALID_CONTENT                      :: 734;
    NOFRAMES_INVALID_LINK                         :: 735;
    REMOVE_FLICKER_SCRIPT                         :: 736;
    REMOVE_FLICKER_OBJECT                         :: 737;
    REMOVE_FLICKER_EMBED                          :: 738;
    REMOVE_FLICKER_APPLET                         :: 739;
    REMOVE_FLICKER_ANIMATED_GIF                   :: 740;
    REMOVE_BLINK_MARQUEE                          :: 741;
    REMOVE_AUTO_REFRESH                           :: 742;
    REMOVE_AUTO_REDIRECT                          :: 743;
    ENSURE_PROGRAMMATIC_OBJECTS_ACCESSIBLE_SCRIPT :: 744;
    ENSURE_PROGRAMMATIC_OBJECTS_ACCESSIBLE_OBJECT :: 745;
    ENSURE_PROGRAMMATIC_OBJECTS_ACCESSIBLE_APPLET :: 746;
    ENSURE_PROGRAMMATIC_OBJECTS_ACCESSIBLE_EMBED  :: 747;
    IMAGE_MAP_SERVER_SIDE_REQUIRES_CONVERSION     :: 748;
    SCRIPT_NOT_KEYBOARD_ACCESSIBLE_ON_MOUSE_DOWN  :: 749;
    SCRIPT_NOT_KEYBOARD_ACCESSIBLE_ON_MOUSE_UP    :: 750;
    SCRIPT_NOT_KEYBOARD_ACCESSIBLE_ON_CLICK       :: 751;
    SCRIPT_NOT_KEYBOARD_ACCESSIBLE_ON_MOUSE_OVER  :: 752;
    SCRIPT_NOT_KEYBOARD_ACCESSIBLE_ON_MOUSE_OUT   :: 753;
    SCRIPT_NOT_KEYBOARD_ACCESSIBLE_ON_MOUSE_MOVE  :: 754;
    NEW_WINDOWS_REQUIRE_WARNING_NEW               :: 755;
    NEW_WINDOWS_REQUIRE_WARNING_BLANK             :: 756;
    REPLACE_DEPRECATED_HTML_APPLET                :: 757;
    REPLACE_DEPRECATED_HTML_BASEFONT              :: 758;
    REPLACE_DEPRECATED_HTML_CENTER                :: 759;
    REPLACE_DEPRECATED_HTML_DIR                   :: 760;
    REPLACE_DEPRECATED_HTML_FONT                  :: 761;
    REPLACE_DEPRECATED_HTML_ISINDEX               :: 762;
    REPLACE_DEPRECATED_HTML_MENU                  :: 763;
    REPLACE_DEPRECATED_HTML_S                     :: 764;
    REPLACE_DEPRECATED_HTML_STRIKE                :: 765;
    REPLACE_DEPRECATED_HTML_U                     :: 766;
    FRAME_MISSING_TITLE                           :: 767;
    FRAME_TITLE_INVALID_NULL                      :: 768;
    FRAME_TITLE_INVALID_SPACES                    :: 769;
    ASSOCIATE_LABELS_EXPLICITLY                   :: 770;
    ASSOCIATE_LABELS_EXPLICITLY_FOR               :: 771;
    ASSOCIATE_LABELS_EXPLICITLY_ID                :: 772;
    LINK_TEXT_NOT_MEANINGFUL                      :: 773;
    LINK_TEXT_MISSING                             :: 774;
    LINK_TEXT_TOO_LONG                            :: 775;
    LINK_TEXT_NOT_MEANINGFUL_CLICK_HERE           :: 776;
    METADATA_MISSING                              :: 777;
    METADATA_MISSING_REDIRECT_AUTOREFRESH         :: 778;
    SKIPOVER_ASCII_ART                            :: 779;

    TC_LABEL_COL                                  :: 780;
    TC_LABEL_FILE                                 :: 781;
    TC_LABEL_LANG                                 :: 782;
    TC_LABEL_LEVL                                 :: 783;
    TC_LABEL_OPT                                  :: 784;
    TC_MAIN_ERROR_LOAD_CONFIG                     :: 785;
    TC_OPT_ACCESS                                 :: 786;
    TC_OPT_ASCII                                  :: 787;
    TC_OPT_ASHTML                                 :: 788;
    TC_OPT_ASXML                                  :: 789;
    TC_OPT_BARE                                   :: 790;
    TC_OPT_BIG5                                   :: 791;
    TC_OPT_CLEAN                                  :: 792;
    TC_OPT_CONFIG                                 :: 793;
    TC_OPT_ERRORS                                 :: 794;
    TC_OPT_FILE                                   :: 795;
    TC_OPT_GDOC                                   :: 796;
    TC_OPT_HELP                                   :: 797;
    TC_OPT_HELPCFG                                :: 798;
    TC_OPT_HELPENV                                :: 799;
    TC_OPT_HELPOPT                                :: 800;
    TC_OPT_IBM858                                 :: 801;
    TC_OPT_INDENT                                 :: 802;
    TC_OPT_ISO2022                                :: 803;
    TC_OPT_LANGUAGE                               :: 804;
    TC_OPT_LATIN0                                 :: 805;
    TC_OPT_LATIN1                                 :: 806;
    TC_OPT_MAC                                    :: 807;
    TC_OPT_MODIFY                                 :: 808;
    TC_OPT_NUMERIC                                :: 809;
    TC_OPT_OMIT                                   :: 810;
    TC_OPT_OUTPUT                                 :: 811;
    TC_OPT_QUIET                                  :: 812;
    TC_OPT_RAW                                    :: 813;
    TC_OPT_SHIFTJIS                               :: 814;
    TC_OPT_SHOWCFG                                :: 815;
    TC_OPT_EXP_CFG                                :: 816;
    TC_OPT_EXP_DEF                                :: 817;
    TC_OPT_UPPER                                  :: 818;
    TC_OPT_UTF16                                  :: 819;
    TC_OPT_UTF16BE                                :: 820;
    TC_OPT_UTF16LE                                :: 821;
    TC_OPT_UTF8                                   :: 822;
    TC_OPT_VERSION                                :: 823;
    TC_OPT_WIN1252                                :: 824;
    TC_OPT_WRAP                                   :: 825;
    TC_OPT_XML                                    :: 826;
    TC_OPT_XMLCFG                                 :: 827;
    TC_OPT_XMLSTRG                                :: 828;
    TC_OPT_XMLERRS                                :: 829;
    TC_OPT_XMLOPTS                                :: 830;
    TC_OPT_XMLHELP                                :: 831;
    TC_STRING_CONF_HEADER                         :: 832;
    TC_STRING_CONF_NAME                           :: 833;
    TC_STRING_CONF_TYPE                           :: 834;
    TC_STRING_CONF_VALUE                          :: 835;
    TC_STRING_CONF_NOTE                           :: 836;
    TC_STRING_OPT_NOT_DOCUMENTED                  :: 837;
    TC_STRING_OUT_OF_MEMORY                       :: 838;
    TC_STRING_FATAL_ERROR                         :: 839;
    TC_STRING_FILE_MANIP                          :: 840;
    TC_STRING_LANG_MUST_SPECIFY                   :: 841;
    TC_STRING_LANG_NOT_FOUND                      :: 842;
    TC_STRING_MUST_SPECIFY                        :: 843;
    TC_STRING_PROCESS_DIRECTIVES                  :: 844;
    TC_STRING_CHAR_ENCODING                       :: 845;
    TC_STRING_MISC                                :: 846;
    TC_STRING_XML                                 :: 847;
    TC_STRING_UNKNOWN_OPTION                      :: 848;
    TC_STRING_UNKNOWN_OPTION_B                    :: 849;
    TC_STRING_VERS_A                              :: 850;
    TC_STRING_VERS_B                              :: 851;
    TC_TXT_HELP_1                                 :: 852;
    TC_TXT_HELP_2A                                :: 853;
    TC_TXT_HELP_2B                                :: 854;
    TC_TXT_HELP_3                                 :: 855;
    TC_TXT_HELP_3A                                :: 856;
    TC_TXT_HELP_CONFIG                            :: 857;
    TC_TXT_HELP_CONFIG_NAME                       :: 858;
    TC_TXT_HELP_CONFIG_TYPE                       :: 859;
    TC_TXT_HELP_CONFIG_ALLW                       :: 860;
    TC_TXT_HELP_ENV_1                             :: 861;
    TC_TXT_HELP_ENV_1A                            :: 862;
    TC_TXT_HELP_ENV_1B                            :: 863;
    TC_TXT_HELP_ENV_1C                            :: 864;
    TC_TXT_HELP_LANG_1                            :: 865;
    TC_TXT_HELP_LANG_2                            :: 866;
    TC_TXT_HELP_LANG_3                            :: 867;

    TIDYSTRINGS_LAST                              :: 868;
}

_TidyDoc :: struct {
    _opaque: s32;
}
TidyDoc :: *_TidyDoc;
_TidyOption :: struct {
    _opaque: s32;
}
TidyOption :: *_TidyOption;
_TidyNode :: struct {
    _opaque: s32;
}
TidyNode :: *_TidyNode;
_TidyAttr :: struct {
    _opaque: s32;
}
TidyAttr :: *_TidyAttr;
_TidyMessage :: struct {
    _opaque: s32;
}
TidyMessage :: *_TidyMessage;
_TidyMessageArgument :: struct {
    _opaque: s32;
}
TidyMessageArgument :: *_TidyMessageArgument;

TidyAllocatorVtbl :: _TidyAllocatorVtbl;
TidyAllocator :: _TidyAllocator;

/** Tidy's built-in default allocator. */
_TidyAllocator :: struct {
    vtbl: *TidyAllocatorVtbl; /**< The allocator's function table. */
}

/* Forward declarations and typedefs. */
_TidyAllocatorVtbl :: struct {
    alloc:   #type (self: *TidyAllocator, nBytes: u64) -> *void #c_call;
    realloc: #type (self: *TidyAllocator, block: *void, nBytes: u64) -> *void #c_call;
    free:    #type (self: *TidyAllocator, block: *void) -> void #c_call;
    panic:   #type (self: *TidyAllocator, msg: ctmbstr) -> void #c_call;
}

/** Callback for `malloc` replacement */
TidyMalloc :: #type (len: u64) -> *void #c_call;

/** Callback for `realloc` replacement */
TidyRealloc :: #type (buf: *void, len: u64) -> *void #c_call;

/** Callback for `free` replacement */
TidyFree :: #type (buf: *void) -> void #c_call;

/** Callback for out of memory panic state */
TidyPanic :: #type (mssg: ctmbstr) -> void #c_call;

/** Give Tidy a `malloc()` replacement */
setMallocCall :: (fmalloc: TidyMalloc) -> Bool #foreign libtidy "tidySetMallocCall";

/** Give Tidy a `realloc()` replacement */
setReallocCall :: (frealloc: TidyRealloc) -> Bool #foreign libtidy "tidySetReallocCall";

/** Give Tidy a `free()` replacement */
setFreeCall :: (ffree: TidyFree) -> Bool #foreign libtidy "tidySetFreeCall";

/** Give Tidy an "out of memory" handler */
setPanicCall :: (fpanic: TidyPanic) -> Bool #foreign libtidy "tidySetPanicCall";

/** The primary creation of a document instance. Instances of a TidyDoc are used
** throughout the API as a token to represent a particular document. You must
** create at least one TidyDoc instance to initialize the library and begin
** interaction with the API. When done using a TidyDoc instance, be sure to
** `tidyRelease(myTidyDoc);` in order to free related memory.
** @result Returns a TidyDoc instance.
*/
tidyCreate :: () -> TidyDoc #foreign libtidy;

/** Create a document supplying your own, custom TidyAllocator instead of using
** the built-in default. See the @ref Memory module if you want to create and
** use your own allocator.
** @param allocator The allocator to use for creating the document.
** @result Returns a TidyDoc instance.
*/
createWithAllocator :: (allocator: *TidyAllocator) -> TidyDoc #foreign libtidy "tidyCreateWithAllocator";

/** Free all memory and release the TidyDoc. The TidyDoc can not be used after
** this call.
** @param tdoc The TidyDoc to free.
*/
release :: (tdoc: TidyDoc) -> void #foreign libtidy "tidyRelease";

/** Allows the host application to store a chunk of data with each TidyDoc
** instance. This can be useful for callbacks, such as saving a reference to
** `self` within the document.
*/
setAppData :: (tdoc: TidyDoc, appData: *void) -> void #foreign libtidy "tidySetAppData";

/** Returns the data previously stored with `tidySetAppData()`.
** @param tdoc  document where data has been stored.
** @result The pointer to the data block previously stored.
*/
getAppData :: (tdoc: TidyDoc) -> *void #foreign libtidy "tidyGetAppData";

/** Get the release date for the current library.
** @result The string representing the release date.
*/
releaseDate :: () -> ctmbstr #foreign libtidy "tidyReleaseDate";

/** Get the version number for the current library.
** @result The string representing the version number.
*/
libraryVersion :: () -> ctmbstr #foreign libtidy "tidyLibraryVersion";

/** Get the platform for which Tidy was built.
** @result The string representing the version number.
*/
platform :: () -> ctmbstr #foreign libtidy "tidyPlatform";

/** Get status of current document.
** @param tdoc An instance of a TidyDoc to query.
** @result Returns the highest of `2` indicating that errors were present in
**         the document, `1` indicating warnings, and `0` in the case of
**         everything being okay.
*/
status :: (tdoc: TidyDoc) -> s32 #foreign libtidy "tidyStatus";

/** Gets the version of HTML that was output, as an integer, times 100. For
** example, HTML5 will return 500; HTML4.0.1 will return 401.
** @param tdoc An instance of a TidyDoc to query.
** @result Returns the HTML version number (x100).
*/
detectedHtmlVersion :: (tdoc: TidyDoc) -> s32 #foreign libtidy "tidyDetectedHtmlVersion";

/** Indicates whether the output document is or isn't XHTML.
** @param tdoc An instance of a TidyDoc to query.
** @result Returns `yes` if the document is an XHTML type.
*/
detectedXhtml :: (tdoc: TidyDoc) -> Bool #foreign libtidy "tidyDetectedXhtml";

/** Indicates whether or not the input document was XML. If TidyXml tags is
** true, or there was an XML declaration in the input document, then this
** function will return yes.
** @param tdoc An instance of a TidyDoc to query.
** @result Returns `yes` if the input document was XML.
*/
detectedGenericXml :: (tdoc: TidyDoc) -> Bool #foreign libtidy "tidyDetectedGenericXml";

/** Indicates the number of TidyError messages that were generated. For any
** value greater than `0`, output is suppressed unless TidyForceOutput is set.
** @param tdoc An instance of a TidyDoc to query.
** @result Returns the number of TidyError messages that were generated.
*/
errorCount :: (tdoc: TidyDoc) -> u32 #foreign libtidy "tidyErrorCount";

/** Indicates the number of TidyWarning messages that were generated.
** @param tdoc An instance of a TidyDoc to query.
** @result Returns the number of TidyWarning messages that were generated.
*/
warningCount :: (tdoc: TidyDoc) -> u32 #foreign libtidy "tidyWarningCount";

/** Indicates the number of TidyAccess messages that were generated.
** @param tdoc An instance of a TidyDoc to query.
** @result Returns the number of TidyAccess messages that were generated.
*/
accessWarningCount :: (tdoc: TidyDoc) -> u32 #foreign libtidy "tidyAccessWarningCount";

/** Indicates the number of configuration error messages that were generated.
** @param tdoc An instance of a TidyDoc to query.
** @result Returns the number of configuration error messages that were
**         generated.
*/
configErrorCount :: (tdoc: TidyDoc) -> u32 #foreign libtidy "tidyConfigErrorCount";

/** Write more complete information about errors to current error sink.
** @param tdoc An instance of a TidyDoc to query.
*/
errorSummary :: (tdoc: TidyDoc) -> void #foreign libtidy "tidyErrorSummary";

/** Write more general information about markup to current error sink.
** @param tdoc An instance of a TidyDoc to query.
*/
generalInfo :: (tdoc: TidyDoc) -> void #foreign libtidy "tidyGeneralInfo";

/** Load an ASCII Tidy configuration file and set the configuration per its
** contents. Reports config option errors, which can be filtered.
** @result Returns 0 upon success, or any other value if there was an option error.
*/
loadConfig :: (tdoc: TidyDoc, configFile: ctmbstr) -> s32 #foreign libtidy "tidyLoadConfig";

/** Load a Tidy configuration file with the specified character encoding, and
** set the configuration per its contents.  Reports config option errors, which can be filtered.
** @result Returns 0 upon success, or any other value if there was an option error.
*/
loadConfigEnc :: (tdoc: TidyDoc, configFile: ctmbstr, charenc: ctmbstr) -> s32 #foreign libtidy "tidyLoadConfigEnc";

/** Determine whether or not a particular file exists. On Unix systems, the use
** of the tilde to represent the user's home directory is supported.
** @result Returns `yes` or `no`, indicating whether or not the file exists.
*/
fileExists :: (tdoc: TidyDoc, filename: ctmbstr) -> Bool #foreign libtidy "tidyFileExists";

/** Set the input/output character encoding for parsing markup. Valid values
** include `ascii`, `latin1`, `raw`, `utf8`, `iso2022`, `mac`, `win1252`,
** `utf16le`, `utf16be`, `utf16`, `big5`, and `shiftjis`. These values are not
** case sensitive.
** @note This is the same as using TidySetInCharEncoding() and
**       TidySetOutCharEncoding() to set the same value.
** @result Returns 0 upon success, or a system standard error number `EINVAL`.
*/
setCharEncoding :: (tdoc: TidyDoc, encnam: ctmbstr) -> s32 #foreign libtidy "tidySetCharEncoding";

/** Set the input encoding for parsing markup.  Valid values include `ascii`,
** `latin1`, `raw`, `utf8`, `iso2022`, `mac`, `win1252`, `utf16le`, `utf16be`,
** `utf16`, `big5`, and `shiftjis`. These values are not case sensitive.
** @result Returns 0 upon success, or a system standard error number `EINVAL`.
*/
setInCharEncoding :: (tdoc: TidyDoc, encnam: ctmbstr) -> s32 #foreign libtidy "tidySetInCharEncoding";

/** Set the input encoding for writing markup.  Valid values include `ascii`,
** `latin1`, `raw`, `utf8`, `iso2022`, `mac`, `win1252`, `utf16le`, `utf16be`,
** `utf16`, `big5`, and `shiftjis`. These values are not case sensitive.
** @result Returns 0 upon success, or a system standard error number `EINVAL`.
*/
setOutCharEncoding :: (tdoc: TidyDoc, encnam: ctmbstr) -> s32 #foreign libtidy "tidySetOutCharEncoding";

/** This typedef represents the required signature for your provided callback
** function should you wish to register one with tidySetOptionCallback().
** Your callback function will be provided with the following parameters.
** Note that this is deprecated and you should instead migrate to
** tidySetConfigCallback().
** @param option The option name that was provided.
** @param value The option value that was provided
** @return Your callback function will return `yes` if it handles the provided
**         option, or `no` if it does not. In the latter case, Tidy will issue
**         an unknown configuration option error.
*/
TidyOptCallback :: #type (option: ctmbstr, value: ctmbstr) -> Bool #c_call;

/** Applications using TidyLib may want to augment command-line and
** configuration file options. Setting this callback allows a LibTidy
** application developer to examine command-line and configuration file options
** after LibTidy has examined them and failed to recognize them.
** Note that this is deprecated and you should instead migrate to
** tidySetConfigCallback().
** @result Returns `yes` upon success.
*/
setOptionCallback :: (tdoc: TidyDoc, pOptCallback: TidyOptCallback) -> Bool #foreign libtidy "tidySetOptionCallback";

/** This typedef represents the required signature for your provided callback
** function should you wish to register one with tidySetConfigCallback().
** Your callback function will be provided with the following parameters.
** @param tdoc The document instance for which the callback was invoked.
** @param option The option name that was provided.
** @param value The option value that was provided
** @return Your callback function will return `yes` if it handles the provided
**         option, or `no` if it does not. In the latter case, Tidy will issue
**         an unknown configuration option error.
*/
TidyConfigCallback :: #type (tdoc: TidyDoc, option: ctmbstr, value: ctmbstr) -> Bool #c_call;

/** Applications using TidyLib may want to augment command-line and
** configuration file options. Setting this callback allows a LibTidy
** application developer to examine command-line and configuration file options
** after LibTidy has examined them and failed to recognize them.
** @result Returns `yes` upon success.
*/
setConfigCallback :: (tdoc: TidyDoc, pConfigCallback: TidyConfigCallback) -> Bool #foreign libtidy "tidySetConfigCallback";

/** This typedef represents the required signature for your provided callback
** function should you wish to register one with tidySetConfigChangeCallback().
** Your callback function will be provided with the following parameters.
** @param tdoc The document instance for which the callback was invoked.
** @param option The option that will be changed.
*/
TidyConfigChangeCallback :: #type (tdoc: TidyDoc, option: TidyOption) -> void #c_call;

/** Applications using TidyLib may want to be informed when changes to options
** are made. Temporary changes made internally by Tidy are not reported, but
** permanent changes made by Tidy (such as indent-spaces or output-encoding)
** will be reported.
** @note This callback is not currently implemented.
** @result Returns `yes` upon success.
*/
setConfigChangeCallback :: (tdoc: TidyDoc, pCallback: TidyConfigChangeCallback) -> Bool #foreign libtidy "tidySetConfigChangeCallback";

/** Get ID of given Option
** @param opt An instance of a TidyOption to query.
** @result The TidyOptionId of the given option.
*/
optGetId :: (opt: TidyOption) -> TidyOptionId #foreign libtidy "tidyOptGetId";

/** Returns the TidyOptionId (enum value) by providing the name of a Tidy
** configuration option.
** @param optnam The name of the option ID to retrieve.
** @result The TidyOptionId of the given `optname`.
*/
optGetIdForName :: (optnam: ctmbstr) -> TidyOptionId #foreign libtidy "tidyOptGetIdForName";

/** Initiates an iterator for a list of TidyOption instances, which allows you
** to iterate through all of the available options. In order to iterate through
** the available options, initiate the iterator with this function, and then
** use tidyGetNextOption() to retrieve the first and subsequent options. For
** example:
** @code{.c}
**   TidyIterator itOpt = tidyGetOptionList( tdoc );
**   while ( itOpt ) {
**     TidyOption opt = tidyGetNextOption( tdoc, &itOpt );
**     // Use other API to query or set set option values
**   }
** @endcode
** @param tdoc An instance of a TidyDoc to query.
** @result Returns a TidyIterator, which is a token used to represent the
**         current position in a list within LibTidy.
*/
getOptionList :: (tdoc: TidyDoc) -> TidyIterator #foreign libtidy "tidyGetOptionList";

/** Given a valid TidyIterator initiated with tidyGetOptionList(), returns
** the instance of the next TidyOption.
** @note This function will return internal-only option types including
**       `TidyInternalCategory`; you should *never* use these. Always ensure
**       that you use `tidyOptGetCategory()` before assuming that an option
**       is okay to use in your application.
** @result An instance of TidyOption.
*/
getNextOption :: (tdoc: TidyDoc, pos: *TidyIterator) -> TidyOption #foreign libtidy "tidyGetNextOption";

/** Retrieves an instance of TidyOption given a valid TidyOptionId.
** @result An instance of TidyOption matching the provided TidyOptionId.
*/
getOption :: (tdoc: TidyDoc, optId: TidyOptionId) -> TidyOption #foreign libtidy "tidyGetOption";

/** Returns an instance of TidyOption by providing the name of a Tidy
** configuration option.
** @result The TidyOption of the given `optname`.
*/
getOptionByName :: (tdoc: TidyDoc, optnam: ctmbstr) -> TidyOption #foreign libtidy "tidyGetOptionByName";

/** Get name of given Option
** @param opt An instance of a TidyOption to query.
** @result The name of the given option.
*/
optGetName :: (opt: TidyOption) -> ctmbstr #foreign libtidy "tidyOptGetName";

/** Get datatype of given Option
** @param opt An instance of a TidyOption to query.
** @result The TidyOptionType of the given option.
*/
optGetType :: (opt: TidyOption) -> TidyOptionType #foreign libtidy "tidyOptGetType";

/** Indicates that an option takes a list of items.
** @param opt An instance of a TidyOption to query.
** @result A bool indicating whether or not the option accepts a list.
*/
optionIsList :: (opt: TidyOption) -> Bool #foreign libtidy "tidyOptionIsList";

/** Is Option read-only? Some options (mainly internal use only options) are
** read-only.
** @deprecated This is no longer a valid test for the public API; instead
**   you should test an option's availability using `tidyOptGetCategory()`
**   against `TidyInternalCategory`. This API will be removed!
** @param opt An instance of a TidyOption to query.
** @result Returns `yes` or `no` depending on whether or not the specified
**         option is read-only.
*/
optIsReadOnly :: (opt: TidyOption) -> Bool #foreign libtidy "tidyOptIsReadOnly";

/** Get category of given Option
** @param opt An instance of a TidyOption to query.
** @result The TidyConfigCategory of the specified option.
*/
optGetCategory :: (opt: TidyOption) -> TidyConfigCategory #foreign libtidy "tidyOptGetCategory";

/** Get default value of given Option as a string
** @param opt An instance of a TidyOption to query.
** @result A string indicating the default value of the specified option.
*/
optGetDefault :: (opt: TidyOption) -> ctmbstr #foreign libtidy "tidyOptGetDefault";

/** Get default value of given Option as an unsigned integer
** @param opt An instance of a TidyOption to query.
** @result An unsigned integer indicating the default value of the specified
**         option.
*/
optGetDefaultInt :: (opt: TidyOption) -> u64 #foreign libtidy "tidyOptGetDefaultInt";

/** Get default value of given Option as a Boolean value
** @param opt An instance of a TidyOption to query.
** @result A boolean indicating the default value of the specified option.
*/
optGetDefaultBool :: (opt: TidyOption) -> Bool #foreign libtidy "tidyOptGetDefaultBool";

/** Initiates an iterator for a list of TidyOption pick-list values, which
** allows you iterate through all of the available option values. In order to
** iterate through the available values, initiate the iterator with this
** function, and then use tidyOptGetNextPick() to retrieve the first and
** subsequent option values. For example:
** @code{.c}
**   TidyIterator itOpt = tidyOptGetPickList( opt );
**   while ( itOpt ) {
**     printf("%s", tidyOptGetNextPick( opt, &itOpt ));
**   }
** @endcode
** @param opt An instance of a TidyOption to query.
** @result Returns a TidyIterator, which is a token used to represent the
**         current position in a list within LibTidy.
*/
optGetPickList :: (opt: TidyOption) -> TidyIterator #foreign libtidy "tidyOptGetPickList";

/** Given a valid TidyIterator initiated with tidyOptGetPickList(), returns a
** string representing a possible option value.
** @result A string containing the next pick-list option value.
*/
optGetNextPick :: (opt: TidyOption, pos: *TidyIterator) -> ctmbstr #foreign libtidy "tidyOptGetNextPick";

/** Get the current value of the option ID for the given document.
** @remark The optId *must* have a @ref TidyOptionType of @ref TidyString!
*/
optGetValue :: (tdoc: TidyDoc, optId: TidyOptionId) -> ctmbstr #foreign libtidy "tidyOptGetValue";

/** Set the option value as a string.
** @remark The optId *must* have a @ref TidyOptionType of @ref TidyString!
** @result Returns a bool indicating success or failure.
*/
optSetValue :: (tdoc: TidyDoc, optId: TidyOptionId, val: ctmbstr) -> Bool #foreign libtidy "tidyOptSetValue";

/** Set named option value as a string, regardless of the @ref TidyOptionType.
** @remark This is good setter if you are unsure of the type.
** @result Returns a bool indicating success or failure.
*/
optParseValue :: (tdoc: TidyDoc, optnam: ctmbstr, val: ctmbstr) -> Bool #foreign libtidy "tidyOptParseValue";

/** Get current option value as an integer.
** @result Returns the integer value of the specified option.
*/
optGetInt :: (tdoc: TidyDoc, optId: TidyOptionId) -> u64 #foreign libtidy "tidyOptGetInt";

/** Set option value as an integer.
** @result Returns a bool indicating success or failure.
*/
optSetInt :: (tdoc: TidyDoc, optId: TidyOptionId, val: u64) -> Bool #foreign libtidy "tidyOptSetInt";

/** Get current option value as a Boolean flag.
** @result Returns a bool indicating the value.
*/
optGetBool :: (tdoc: TidyDoc, optId: TidyOptionId) -> Bool #foreign libtidy "tidyOptGetBool";

/** Set option value as a Boolean flag.
** @result Returns a bool indicating success or failure.
*/
optSetBool :: (tdoc: TidyDoc, optId: TidyOptionId, val: Bool) -> Bool #foreign libtidy "tidyOptSetBool";

/** Reset option to default value by ID.
** @result Returns a bool indicating success or failure.
*/
optResetToDefault :: (tdoc: TidyDoc, opt: TidyOptionId) -> Bool #foreign libtidy "tidyOptResetToDefault";

/** Reset all options to their default values.
** @param tdoc The tidy document for which to reset all values.
** @result Returns a bool indicating success or failure.
*/
optResetAllToDefault :: (tdoc: TidyDoc) -> Bool #foreign libtidy "tidyOptResetAllToDefault";

/** Take a snapshot of current config settings. These settings are stored
** within the tidy document. Note, however, that snapshots do not reliably
** survive the tidyParseXXX() process, as Tidy uses the snapshot mechanism
** in order to store the current configuration right at the beginning of the
** parsing process.
** @param tdoc The tidy document for which to take a snapshot.
** @result Returns a bool indicating success or failure.
*/
optSnapshot :: (tdoc: TidyDoc) -> Bool #foreign libtidy "tidyOptSnapshot";

/** Apply a snapshot of config settings to a document.
** @param tdoc The tidy document for which to apply a snapshot.
** @result Returns a bool indicating success or failure.
*/
optResetToSnapshot :: (tdoc: TidyDoc) -> Bool #foreign libtidy "tidyOptResetToSnapshot";

/** Any settings different than default?
** @param tdoc The tidy document to check.
** @result Returns a bool indicating whether or not a difference exists.
*/
optDiffThanDefault :: (tdoc: TidyDoc) -> Bool #foreign libtidy "tidyOptDiffThanDefault";

/** Any settings different than snapshot?
** @param tdoc The tidy document to check.
** @result Returns a bool indicating whether or not a difference exists.
*/
optDiffThanSnapshot :: (tdoc: TidyDoc) -> Bool #foreign libtidy "tidyOptDiffThanSnapshot";

/** Copy current configuration settings from one document to another. Note
** that the destination document's existing settings will be stored as that
** document's snapshot prior to having its option values overwritten by the
** source document's settings.
** @result Returns a bool indicating success or failure.
*/
optCopyConfig :: (tdocTo: TidyDoc, tdocFrom: TidyDoc) -> Bool #foreign libtidy "tidyOptCopyConfig";

/** Get character encoding name. Used with @ref TidyCharEncoding,
** @ref TidyOutCharEncoding, and @ref TidyInCharEncoding.
** @result The encoding name as a string for the specified option.
*/
optGetEncName :: (tdoc: TidyDoc, optId: TidyOptionId) -> ctmbstr #foreign libtidy "tidyOptGetEncName";

/** Get the current pick list value for the option ID, which can be useful for
** enum types.
** @result Returns a string indicating the current value of the specified
**         option.
*/
optGetCurrPick :: (tdoc: TidyDoc, optId: TidyOptionId) -> ctmbstr #foreign libtidy "tidyOptGetCurrPick";

/** Initiates an iterator for a list of user-declared tags, including autonomous
** custom tags detected in the document if @ref TidyUseCustomTags is not set to
** **no**. This iterator allows you to iterate through all of the custom tags.
** In order to iterate through the tags, initiate the iterator with this
** function, and then use tidyOptGetNextDeclTag() to retrieve the first and
** subsequent tags. For example:
** @code{.c}
**   TidyIterator itTag = tidyOptGetDeclTagList( tdoc );
**   while ( itTag ) {
**     printf("%s", tidyOptGetNextDeclTag( tdoc, TidyBlockTags, &itTag ));
**   }
** @endcode
** @param tdoc An instance of a TidyDoc to query.
** @result Returns a TidyIterator, which is a token used to represent the
**         current position in a list within LibTidy.
*/
optGetDeclTagList :: (tdoc: TidyDoc) -> TidyIterator #foreign libtidy "tidyOptGetDeclTagList";

/** Given a valid TidyIterator initiated with tidyOptGetDeclTagList(), returns a
** string representing a user-declared or autonomous custom tag.
** @remark Specifying optId limits the scope of the tags to one of
**         @ref TidyInlineTags, @ref TidyBlockTags, @ref TidyEmptyTags, or
**         @ref TidyPreTags. Note that autonomous custom tags (if used) are
**         added to one of these option types, depending on the value of
**         @ref TidyUseCustomTags.
** @result A string containing the next tag.
*/
optGetNextDeclTag :: (tdoc: TidyDoc, optId: TidyOptionId, iter: *TidyIterator) -> ctmbstr #foreign libtidy "tidyOptGetNextDeclTag";

/** Initiates an iterator for a list of priority attributes. This iterator
** allows you to iterate through all of the priority attributes defined with
** the `priority-attributes` configuration option. In order to iterate through
** the attributes, initiate the iterator with this function, and then use
** tidyOptGetNextPriorityAttr() to retrieve the first and subsequent attributes.
** For example:
** @code{.c}
**   TidyIterator itAttr = tidyOptGetPriorityAttrList( tdoc );
**   while ( itAttr ) {
**     printf("%s", tidyOptGetNextPriorityAttr( tdoc, &itAttr ));
**   }
** @endcode
** @param tdoc An instance of a TidyDoc to query.
** @result Returns a TidyIterator, which is a token used to represent the
**         current position in a list within LibTidy.
*/
optGetPriorityAttrList :: (tdoc: TidyDoc) -> TidyIterator #foreign libtidy "tidyOptGetPriorityAttrList";

/** Given a valid TidyIterator initiated with tidyOptGetPriorityAttrList(),
** returns a string representing a priority attribute.
** @result A string containing the next tag.
*/
optGetNextPriorityAttr :: (tdoc: TidyDoc, iter: *TidyIterator) -> ctmbstr #foreign libtidy "tidyOptGetNextPriorityAttr";

/** Initiates an iterator for a list of muted messages. This iterator allows
** you to iterate through all of the priority attributes defined with the
** `mute` configuration option. In order to iterate through the list, initiate
** with this function, and then use tidyOptGetNextMutedMessage() to retrieve
** the first and subsequent attributes.
** For example:
** @code{.c}
**   TidyIterator itAttr = tidyOptGetMutedMessageList( tdoc );
**   while ( itAttr ) {
**     printf("%s", tidyOptGetNextMutedMessage( tdoc, &itAttr ));
**   }
** @endcode
** @param tdoc An instance of a TidyDoc to query.
** @result Returns a TidyIterator, which is a token used to represent the
**         current position in a list within LibTidy.
*/
optGetMutedMessageList :: (tdoc: TidyDoc) -> TidyIterator #foreign libtidy "tidyOptGetMutedMessageList";

/** Given a valid TidyIterator initiated with tidyOptGetMutedMessageList(),
** returns a string representing a muted message.
** @result A string containing the next tag.
*/
optGetNextMutedMessage :: (tdoc: TidyDoc, iter: *TidyIterator) -> ctmbstr #foreign libtidy "tidyOptGetNextMutedMessage";

/** Get the description of the specified option.
** @result Returns a string containing a description of the given option.
*/
optGetDoc :: (tdoc: TidyDoc, opt: TidyOption) -> ctmbstr #foreign libtidy "tidyOptGetDoc";

/** Given a valid TidyIterator initiated with tidyOptGetDocLinksList(), returns
** a TidyOption instance.
** @result Returns in instance of TidyOption.
*/
optGetNextDocLinks :: (tdoc: TidyDoc, pos: *TidyIterator) -> TidyOption #foreign libtidy "tidyOptGetNextDocLinks";

TidyBuffer :: _TidyBuffer;

/** Input Callback: get next byte of input */
TidyGetByteFunc :: #type (sourceData: *void) -> s32 #c_call;

/** Input Callback: unget a byte of input */
TidyUngetByteFunc :: #type (sourceData: *void, bt: byte) -> void #c_call;

/** Input Callback: is end of input? */
TidyEOFFunc :: #type (sourceData: *void) -> Bool #c_call;

/** This type defines an input source capable of delivering raw bytes of input.
*/
_TidyInputSource :: struct {
    sourceData: *void; /**< Input context. Passed to callbacks. */

    getByte:    TidyGetByteFunc; /**< Pointer to "get byte" callback. */
    ungetByte:  TidyUngetByteFunc; /**< Pointer to "unget" callback. */
    eof:        TidyEOFFunc; /**< Pointer to "eof" callback. */
}

/** This type defines an input source capable of delivering raw bytes of input.
*/
TidyInputSource :: _TidyInputSource;

/** Facilitates user defined source by providing an entry point to marshal
** pointers-to-functions. This is needed by .NET, and possibly other language
** bindings.
** @result Returns a bool indicating success or failure.
*/
initSource :: (source: *TidyInputSource, srcData: *void, gbFunc: TidyGetByteFunc, ugbFunc: TidyUngetByteFunc, endFunc: TidyEOFFunc) -> Bool #foreign libtidy "tidyInitSource";

/** Helper: get next byte from input source.
** @param source A pointer to your input source.
** @result Returns a byte as an unsigned integer.
*/
getByte :: (source: *TidyInputSource) -> u32 #foreign libtidy "tidyGetByte";

/** Helper: unget byte back to input source. */
ungetByte :: (source: *TidyInputSource, byteValue: u32) -> void #foreign libtidy "tidyUngetByte";

/** Helper: check if input source at end.
** @param source The input source.
** @result Returns a bool indicating whether or not the source is at EOF.
*/
isEOF :: (source: *TidyInputSource) -> Bool #foreign libtidy "tidyIsEOF";

/** Output callback: send a byte to output */
TidyPutByteFunc :: #type (sinkData: *void, bt: byte) -> void #c_call;

/** This type defines an output destination capable of accepting raw bytes
** of output
*/
_TidyOutputSink :: struct {
    sinkData: *void; /**< Output context. Passed to callbacks. */

    putByte:  TidyPutByteFunc; /**< Pointer to "put byte" callback */
}

/** This type defines an output destination capable of accepting raw bytes
** of output
*/
TidyOutputSink :: _TidyOutputSink;

/** Facilitates user defined sinks by providing an entry point to marshal
** pointers-to-functions. This is needed by .NET, and possibly other language
** bindings.
** @result Returns a bool indicating success or failure.
*/
initSink :: (sink: *TidyOutputSink, snkData: *void, pbFunc: TidyPutByteFunc) -> Bool #foreign libtidy "tidyInitSink";

/** Helper: send a byte to output. */
putByte :: (sink: *TidyOutputSink, byteValue: u32) -> void #foreign libtidy "tidyPutByte";

/** Set the file path to use for reports when `TidyEmacs` is being used. This
** function provides a proper interface for using the hidden, internal-only
** `TidyEmacsFile` configuration option.
*/
setEmacsFile :: (tdoc: TidyDoc, filePath: ctmbstr) -> void #foreign libtidy "tidySetEmacsFile";

/** Get the file path to use for reports when `TidyEmacs` is being used. This
** function provides a proper interface for using the hidden, internal-only
** `TidyEmacsFile` configuration option.
** @param tdoc The tidy document for which you want to fetch the file path.
** @result Returns a string indicating the file path.
*/
getEmacsFile :: (tdoc: TidyDoc) -> ctmbstr #foreign libtidy "tidyGetEmacsFile";

/** Set error sink to named file.
** @result Returns a file handle.
*/
setErrorFile :: (tdoc: TidyDoc, errfilnam: ctmbstr) -> *FILE #foreign libtidy "tidySetErrorFile";

/** Set error sink to given buffer.
** @result Returns 0 upon success or a standard error number.
*/
setErrorBuffer :: (tdoc: TidyDoc, errbuf: *TidyBuffer) -> s32 #foreign libtidy "tidySetErrorBuffer";

/** Set error sink to given generic sink.
** @result Returns 0 upon success or a standard error number.
*/
setErrorSink :: (tdoc: TidyDoc, sink: *TidyOutputSink) -> s32 #foreign libtidy "tidySetErrorSink";

/** This typedef represents the required signature for your provided callback
** function should you wish to register one with tidySetReportFilter().
** Your callback function will be provided with the following parameters.
** @param tdoc Indicates the tidy document the message comes from.
** @param lvl Specifies the TidyReportLevel of the message.
** @param line Indicates the line number in the source document the message applies to.
** @param col Indicates the column in the source document the message applies to.
** @param mssg Specifies the complete message as Tidy would emit it.
** @return Your callback function will return `yes` if Tidy should include the
**         report in its own output sink, or `no` if Tidy should suppress it.
*/
TidyReportFilter :: #type (tdoc: TidyDoc, lvl: TidyReportLevel, line: u32, col: u32, mssg: ctmbstr) -> Bool #c_call;

/** This function informs Tidy to use the specified callback to send reports. */
setReportFilter :: (tdoc: TidyDoc, filtCallback: TidyReportFilter) -> Bool #foreign libtidy "tidySetReportFilter";

/** This typedef represents the required signature for your provided callback
** function should you wish to register one with tidySetMessageCallback().
** Your callback function will be provided with the following parameters.
** @param tmessage An opaque type used as a token against which other API
**        calls can be made.
** @return Your callback function will return `yes` if Tidy should include the
**         report in its own output sink, or `no` if Tidy should suppress it.
*/
TidyMessageCallback :: #type (tmessage: TidyMessage) -> Bool #c_call;

/** This function informs Tidy to use the specified callback to send reports. */
setMessageCallback :: (tdoc: TidyDoc, filtCallback: TidyMessageCallback) -> Bool #foreign libtidy "tidySetMessageCallback";

/** Get the tidy document this message comes from.
** @param tmessage Specify the message that you are querying.
** @result Returns the TidyDoc that generated the message.
*/
getMessageDoc :: (tmessage: TidyMessage) -> TidyDoc #foreign libtidy "tidyGetMessageDoc";

/** Get the message code.
** @param tmessage Specify the message that you are querying.
** @result Returns a code representing the message. This code can be used
**         directly with the localized strings API; however we never make
**         any guarantees about the value of these codes. For code stability
**         don't store this value in your own application. Instead use the
**         enum field or use the message key string value.
*/
getMessageCode :: (tmessage: TidyMessage) -> u32 #foreign libtidy "tidyGetMessageCode";

/** Get the message key string.
** @param tmessage Specify the message that you are querying.
** @result Returns a string representing the message. This string is intended
**         to be stable by the LibTidy API, and is suitable for use as a key
**         in your own applications.
*/
getMessageKey :: (tmessage: TidyMessage) -> ctmbstr #foreign libtidy "tidyGetMessageKey";

/** Get the line number the message applies to.
** @param tmessage Specify the message that you are querying.
** @result Returns the line number, if any, that generated the message.
*/
getMessageLine :: (tmessage: TidyMessage) -> s32 #foreign libtidy "tidyGetMessageLine";

/** Get the column the message applies to.
** @param tmessage Specify the message that you are querying.
** @result Returns the column number, if any, that generated the message.
*/
getMessageColumn :: (tmessage: TidyMessage) -> s32 #foreign libtidy "tidyGetMessageColumn";

/** Get the TidyReportLevel of the message.
** @param tmessage Specify the message that you are querying.
** @result Returns a TidyReportLevel indicating the severity or status of the
**         message.
*/
getMessageLevel :: (tmessage: TidyMessage) -> TidyReportLevel #foreign libtidy "tidyGetMessageLevel";

/** Get the muted status of the message, that is, whether or not the
** current configuration indicated that this message should be muted.
** @param tmessage Specify the message that you are querying.
** @result Returns a Bool indicating that the config indicates muting this
**         message.
*/
getMessageIsMuted :: (tmessage: TidyMessage) -> Bool #foreign libtidy "tidyGetMessageIsMuted";

/** Get the default format string, which is the format string for the message
** in Tidy's default localization (en_us).
** @param tmessage Specify the message that you are querying.
** @result Returns the default localization format string of the message.
*/
getMessageFormatDefault :: (tmessage: TidyMessage) -> ctmbstr #foreign libtidy "tidyGetMessageFormatDefault";

/** Get the localized format string. If a localized version of the format string
** doesn't exist, then the default version will be returned.
** @param tmessage Specify the message that you are querying.
** @result Returns the localized format string of the message.
*/
getMessageFormat :: (tmessage: TidyMessage) -> ctmbstr #foreign libtidy "tidyGetMessageFormat";

/** Get the message with the format string already completed, in Tidy's
** default localization.
** @param tmessage Specify the message that you are querying.
** @result Returns the message in the default localization.
*/
getMessageDefault :: (tmessage: TidyMessage) -> ctmbstr #foreign libtidy "tidyGetMessageDefault";

/** Get the message with the format string already completed, in Tidy's
** current localization.
** @param tmessage Specify the message that you are querying.
** @result Returns the message in the current localization.
*/
getMessage :: (tmessage: TidyMessage) -> ctmbstr #foreign libtidy "tidyGetMessage";

/** Get the position part part of the message in the default language.
** @param tmessage Specify the message that you are querying.
** @result Returns the positional part of a string as Tidy would display it
**         in the console application.
*/
getMessagePosDefault :: (tmessage: TidyMessage) -> ctmbstr #foreign libtidy "tidyGetMessagePosDefault";

/** Get the position part part of the message in the current language.
** @param tmessage Specify the message that you are querying.
** @result Returns the positional part of a string as Tidy would display it
**         in the console application.
*/
getMessagePos :: (tmessage: TidyMessage) -> ctmbstr #foreign libtidy "tidyGetMessagePos";

/** Get the prefix part of a message in the default language.
** @param tmessage Specify the message that you are querying.
** @result Returns the message prefix part of a string as Tidy would display
**         it in the console application.
*/
getMessagePrefixDefault :: (tmessage: TidyMessage) -> ctmbstr #foreign libtidy "tidyGetMessagePrefixDefault";

/** Get the prefix part of a message in the current language.
** @param tmessage Specify the message that you are querying.
** @result Returns the message prefix part of a string as Tidy would display
**         it in the console application.
*/
getMessagePrefix :: (tmessage: TidyMessage) -> ctmbstr #foreign libtidy "tidyGetMessagePrefix";

/** Get the complete message as Tidy would emit it in the default localization.
** @param tmessage Specify the message that you are querying.
** @result Returns the complete message just as Tidy would display it on the
**         console.
*/
getMessageOutputDefault :: (tmessage: TidyMessage) -> ctmbstr #foreign libtidy "tidyGetMessageOutputDefault";

/** Get the complete message as Tidy would emit it in the current localization.
** @param tmessage Specify the message that you are querying.
** @result Returns the complete message just as Tidy would display it on the
**         console.
*/
getMessageOutput :: (tmessage: TidyMessage) -> ctmbstr #foreign libtidy "tidyGetMessageOutput";

/** Initiates an iterator for a list of arguments related to a given message.
** This iterator allows you to iterate through all of the arguments, if any.
** In order to iterate through the arguments, initiate the iterator with this
** function, and then use tidyGetNextMessageArgument() to retrieve the first
** and subsequent arguments. For example:
** @code{.c}
**   TidyIterator itArg = tidyGetMessageArguments( tmessage );
**   while ( itArg ) {
**     TidyMessageArgument my_arg = tidyGetNextMessageArgument( tmessage, &itArg );
**     // do something with my_arg, such as inspect its value or format
**   }
** @endcode
** @param tmessage The message about whose arguments you wish to query.
** @result Returns a TidyIterator, which is a token used to represent the
**         current position in a list within LibTidy.
*/
getMessageArguments :: (tmessage: TidyMessage) -> TidyIterator #foreign libtidy "tidyGetMessageArguments";

/** Given a valid TidyIterator initiated with tidyGetMessageArguments(), returns
** an instance of the opaque type TidyMessageArgument, which serves as a token
** against which the remaining argument API functions may be used to query
** information.
** @result Returns an instance of TidyMessageArgument.
*/
getNextMessageArgument :: (tmessage: TidyMessage, iter: *TidyIterator) -> TidyMessageArgument #foreign libtidy "tidyGetNextMessageArgument";

/** Returns the `TidyFormatParameterType` of the given message argument.
** @result Returns the type of parameter of type TidyFormatParameterType.
*/
getArgType :: (tmessage: TidyMessage, arg: *TidyMessageArgument) -> TidyFormatParameterType #foreign libtidy "tidyGetArgType";

/** Returns the format specifier of the given message argument. The memory for
** this string is cleared upon termination of the callback, so do be sure to
** make your own copy.
** @result Returns the format specifier string of the given argument.
*/
getArgFormat :: (tmessage: TidyMessage, arg: *TidyMessageArgument) -> ctmbstr #foreign libtidy "tidyGetArgFormat";

/** Returns the string value of the given message argument. An assertion
** will be generated if the argument type is not a string.
** @result Returns the string value of the given argument.
*/
getArgValueString :: (tmessage: TidyMessage, arg: *TidyMessageArgument) -> ctmbstr #foreign libtidy "tidyGetArgValueString";

/** Returns the unsigned integer value of the given message argument. An
** assertion will be generated if the argument type is not an unsigned int.
** @result Returns the unsigned integer value of the given argument.
*/
getArgValueUInt :: (tmessage: TidyMessage, arg: *TidyMessageArgument) -> u32 #foreign libtidy "tidyGetArgValueUInt";

/** Returns the integer value of the given message argument. An assertion
** will be generated if the argument type is not an integer.
** @result Returns the integer value of the given argument.
*/
getArgValueInt :: (tmessage: TidyMessage, arg: *TidyMessageArgument) -> s32 #foreign libtidy "tidyGetArgValueInt";

/**
*  Returns the double value of the given message argument. An assertion
*  will be generated if the argument type is not a double.
** @result Returns the double value of the given argument.
*/
getArgValueDouble :: (tmessage: TidyMessage, arg: *TidyMessageArgument) -> float64 #foreign libtidy "tidyGetArgValueDouble";

/** This typedef represents the required signature for your provided callback
** function should you wish to register one with tidySetMessageCallback().
** Your callback function will be provided with the following parameters.
** @param tdoc Indicates the source tidy document.
** @param line Indicates the line in the source document at this point in the process.
** @param col Indicates the column in the source document at this point in the process.
** @param destLine Indicates the line number in the output document at this point in the process.
*/
TidyPPProgress :: #type (tdoc: TidyDoc, line: u32, col: u32, destLine: u32) -> void #c_call;

/** This function informs Tidy to use the specified callback for tracking the
** pretty-printing process progress.
*/
setPrettyPrinterCallback :: (tdoc: TidyDoc, callback: TidyPPProgress) -> Bool #foreign libtidy "tidySetPrettyPrinterCallback";

/** Parse markup in named file.
** @result Returns the highest of `2` indicating that errors were present in
**         the document, `1` indicating warnings, and `0` in the case of
**         everything being okay.
*/
parseFile :: (tdoc: TidyDoc, filename: ctmbstr) -> s32 #foreign libtidy "tidyParseFile";

/** Parse markup from the standard input.
** @param tdoc The tidy document to use for parsing.
** @result Returns the highest of `2` indicating that errors were present in
**         the document, `1` indicating warnings, and `0` in the case of
**         everything being okay.
*/
parseStdin :: (tdoc: TidyDoc) -> s32 #foreign libtidy "tidyParseStdin";

/** Parse markup in given string. Note that the supplied string is of type
** `ctmbstr` based on `char` and therefore doesn't support the use of
** UTF-16 strings. Use `tidyParseBuffer()` if parsing multibyte strings.
** @result Returns the highest of `2` indicating that errors were present in
**         the document, `1` indicating warnings, and `0` in the case of
**         everything being okay.
*/
parseString :: (tdoc: TidyDoc, content: ctmbstr) -> s32 #foreign libtidy "tidyParseString";

/** Parse markup in given buffer.
** @result Returns the highest of `2` indicating that errors were present in
**         the document, `1` indicating warnings, and `0` in the case of
**         everything being okay.
*/
parseBuffer :: (tdoc: TidyDoc, buf: *TidyBuffer) -> s32 #foreign libtidy "tidyParseBuffer";

/** Parse markup in given generic input source.
** @result Returns the highest of `2` indicating that errors were present in
**         the document, `1` indicating warnings, and `0` in the case of
**         everything being okay.
*/
parseSource :: (tdoc: TidyDoc, source: *TidyInputSource) -> s32 #foreign libtidy "tidyParseSource";

/** Execute configured cleanup and repair operations on parsed markup.
** @param tdoc The tidy document to use.
** @result An integer representing the status.
*/
cleanAndRepair :: (tdoc: TidyDoc) -> s32 #foreign libtidy "tidyCleanAndRepair";

/** Reports the document type and diagnostic statistics on parsed and repaired
** markup. You must call tidyCleanAndRepair() before using this function.
** @param tdoc The tidy document to use.
** @result An integer representing the status.
*/
runDiagnostics :: (tdoc: TidyDoc) -> s32 #foreign libtidy "tidyRunDiagnostics";

/** Reports the document type into the output sink.
** @param tdoc The tidy document to use.
** @result An integer representing the status.
*/
reportDoctype :: (tdoc: TidyDoc) -> s32 #foreign libtidy "tidyReportDoctype";

/** Save the tidy document to the named file.
** @result An integer representing the status.
*/
saveFile :: (tdoc: TidyDoc, filename: ctmbstr) -> s32 #foreign libtidy "tidySaveFile";

/** Save the tidy document to standard output (FILE*).
** @param tdoc The tidy document to save.
** @result An integer representing the status.
*/
saveStdout :: (tdoc: TidyDoc) -> s32 #foreign libtidy "tidySaveStdout";

/** Save the tidy document to given TidyBuffer object.
** @result An integer representing the status.
*/
saveBuffer :: (tdoc: TidyDoc, buf: *TidyBuffer) -> s32 #foreign libtidy "tidySaveBuffer";

/** Save the tidy document to an application buffer. If TidyShowMarkup and the
** document has no errors, or TidyForceOutput, then the current document (per
** the current configuration) will be pretty printed to this application
** buffer. The document byte length (not character length) will be placed into
** *buflen. The document will not be null terminated. If the buffer is not big
** enough, ENOMEM will be returned, else the actual document status.
** @result An integer representing the status.
*/
saveString :: (tdoc: TidyDoc, buffer: tmbstr, buflen: *u32) -> s32 #foreign libtidy "tidySaveString";

/** Save to given generic output sink.
** @result An integer representing the status.
*/
saveSink :: (tdoc: TidyDoc, sink: *TidyOutputSink) -> s32 #foreign libtidy "tidySaveSink";

/** Save current settings to named file. Only writes non-default values.
** @result An integer representing the status.
*/
optSaveFile :: (tdoc: TidyDoc, cfgfil: ctmbstr) -> s32 #foreign libtidy "tidyOptSaveFile";

/** Save current settings to given output sink. Only non-default values are
** written.
** @result An integer representing the status.
*/
optSaveSink :: (tdoc: TidyDoc, sink: *TidyOutputSink) -> s32 #foreign libtidy "tidyOptSaveSink";

/** Get the root node.
** @param tdoc The document to query.
** @result Returns a tidy node.
*/
getRoot :: (tdoc: TidyDoc) -> TidyNode #foreign libtidy "tidyGetRoot";

/** Get the HTML node.
** @param tdoc The document to query.
** @result Returns a tidy node.
*/
getHtml :: (tdoc: TidyDoc) -> TidyNode #foreign libtidy "tidyGetHtml";

/** Get the HEAD node.
** @param tdoc The document to query.
** @result Returns a tidy node.
*/
getHead :: (tdoc: TidyDoc) -> TidyNode #foreign libtidy "tidyGetHead";

/** Get the BODY node.
** @param tdoc The document to query.
** @result Returns a tidy node.
*/
getBody :: (tdoc: TidyDoc) -> TidyNode #foreign libtidy "tidyGetBody";

/** Get the parent of the indicated node.
** @param tnod The node to query.
** @result Returns a tidy node.
*/
getParent :: (tnod: TidyNode) -> TidyNode #foreign libtidy "tidyGetParent";

/** Get the child of the indicated node.
** @param tnod The node to query.
** @result Returns a tidy node.
*/
getChild :: (tnod: TidyNode) -> TidyNode #foreign libtidy "tidyGetChild";

/** Get the next sibling node.
** @param tnod The node to query.
** @result Returns a tidy node.
*/
getNext :: (tnod: TidyNode) -> TidyNode #foreign libtidy "tidyGetNext";

/** Get the previous sibling node.
** @param tnod The node to query.
** @result Returns a tidy node.
*/
getPrev :: (tnod: TidyNode) -> TidyNode #foreign libtidy "tidyGetPrev";

/** Remove the indicated node.
** @result Returns the next tidy node.
*/
discardElement :: (tdoc: TidyDoc, tnod: TidyNode) -> TidyNode #foreign libtidy "tidyDiscardElement";

/** Get the first attribute.
** @param tnod The node for which to get attributes.
** @result Returns an instance of TidyAttr.
*/
attrFirst :: (tnod: TidyNode) -> TidyAttr #foreign libtidy "tidyAttrFirst";

/** Get the next attribute.
** @param tattr The current attribute, so the next one can be returned.
** @result Returns and instance of TidyAttr.
*/
attrNext :: (tattr: TidyAttr) -> TidyAttr #foreign libtidy "tidyAttrNext";

/** Get the name of a TidyAttr instance.
** @param tattr The tidy attribute to query.
** @result Returns a string indicating the name of the attribute.
*/
attrName :: (tattr: TidyAttr) -> ctmbstr #foreign libtidy "tidyAttrName";

/** Get the value of a TidyAttr instance.
** @param tattr The tidy attribute to query.
** @result Returns a string indicating the value of the attribute.
*/
attrValue :: (tattr: TidyAttr) -> ctmbstr #foreign libtidy "tidyAttrValue";

/** Discard an attribute. */
attrDiscard :: (itdoc: TidyDoc, tnod: TidyNode, tattr: TidyAttr) -> void #foreign libtidy "tidyAttrDiscard";

/** Get the attribute ID given a tidy attribute.
** @param tattr The attribute to query.
** @result Returns the TidyAttrId of the given attribute.
**/
attrGetId :: (tattr: TidyAttr) -> TidyAttrId #foreign libtidy "tidyAttrGetId";

/** Indicates whether or not a given attribute is an event attribute.
** @param tattr The attribute to query.
** @result Returns a bool indicating whether or not the attribute is an event.
**/
attrIsEvent :: (tattr: TidyAttr) -> Bool #foreign libtidy "tidyAttrIsEvent";

/** Get an instance of TidyAttr by specifying an attribute ID.
** @result Returns a TidyAttr instance.
*/
attrGetById :: (tnod: TidyNode, attId: TidyAttrId) -> TidyAttr #foreign libtidy "tidyAttrGetById";

/** Get the type of node.
** @param tnod The node to query.
** @result Returns the type of node as TidyNodeType.
*/
nodeGetType :: (tnod: TidyNode) -> TidyNodeType #foreign libtidy "tidyNodeGetType";

/** Get the name of the node.
** @param tnod The node to query.
** @result Returns a string indicating the name of the node.
*/
nodeGetName :: (tnod: TidyNode) -> ctmbstr #foreign libtidy "tidyNodeGetName";

/** Indicates whether or not a node is a text node.
** @param tnod The node to query.
** @result Returns a bool indicating whether or not the node is a text node.
*/
nodeIsText :: (tnod: TidyNode) -> Bool #foreign libtidy "tidyNodeIsText";

/** Indicates whether or not the node is a propriety type.
** @result Returns a bool indicating whether or not the node is a proprietary type.
*/
nodeIsProp :: (tdoc: TidyDoc, tnod: TidyNode) -> Bool #foreign libtidy "tidyNodeIsProp";

/** Indicates whether or not a node represents and HTML header element, such
** as h1, h2, etc.
** @param tnod The node to query.
** @result Returns a bool indicating whether or not the node is an HTML header.
*/
nodeIsHeader :: (tnod: TidyNode) -> Bool #foreign libtidy "tidyNodeIsHeader";

/** Indicates whether or not the node has text.
** @result Returns the type of node as TidyNodeType.
*/
nodeHasText :: (tdoc: TidyDoc, tnod: TidyNode) -> Bool #foreign libtidy "tidyNodeHasText";

/** Gets the text of a node and places it into the given TidyBuffer. The text will be terminated with a `TidyNewline`.
** If you want the raw utf-8 stream see `tidyNodeGetValue()`.
** @result Returns a bool indicating success or not.
*/
nodeGetText :: (tdoc: TidyDoc, tnod: TidyNode, buf: *TidyBuffer) -> Bool #foreign libtidy "tidyNodeGetText";

/** Get the value of the node. This copies the unescaped value of this node into
** the given TidyBuffer at UTF-8.
** @result Returns a bool indicating success or not.
*/
nodeGetValue :: (tdoc: TidyDoc, tnod: TidyNode, buf: *TidyBuffer) -> Bool #foreign libtidy "tidyNodeGetValue";

/** Get the tag ID of the node.
** @param tnod The node to query.
** @result Returns the tag ID of the node as TidyTagId.
*/
nodeGetId :: (tnod: TidyNode) -> TidyTagId #foreign libtidy "tidyNodeGetId";

/** Get the line number where the node occurs.
** @param tnod The node to query.
** @result Returns the line number.
*/
nodeLine :: (tnod: TidyNode) -> u32 #foreign libtidy "tidyNodeLine";

/** Get the column location of the node.
** @param tnod The node to query.
** @result Returns the column location of the node.
*/
nodeColumn :: (tnod: TidyNode) -> u32 #foreign libtidy "tidyNodeColumn";

/**
** Given a message code, return the text key that represents it.
** @param code The error code to lookup.
** @result The string representing the error code.
*/
errorCodeAsKey :: (code: u32) -> ctmbstr #foreign libtidy "tidyErrorCodeAsKey";

/**
** Given a text key representing a message code, return the uint that
** represents it.
**
** @remark We establish that for external purposes, the API will ensure that
**         string keys remain consistent. *Never* count on the integer value
**         of a message code. Always use this function to ensure that the
**         integer is valid if you need one.
** @param code The string representing the error code.
** @result Returns an integer that represents the error code, which can be
**         used to lookup Tidy's built-in strings. If the provided string does
**         not have a matching message code, then UINT_MAX will be returned.
*/
errorCodeFromKey :: (code: ctmbstr) -> u32 #foreign libtidy "tidyErrorCodeFromKey";

/** Initiates an iterator for a list of message codes available in Tidy.
** This iterator allows you to iterate through all of the code. In orde to
** iterate through the codes, initiate the iterator with this function, and
** then use getNextErrorCode() to retrieve the first and subsequent codes.
** For example:
** @code{.c}
**   TidyIterator itMessage = getErrorCodeList();
**   while ( itMessage ) {
**     uint code = getNextErrorCode( &itMessage );
**     // do something with the code, such as lookup a string.
**   }
** @endcode
** @result Returns a TidyIterator, which is a token used to represent the
**         current position in a list within LibTidy.
*/
getErrorCodeList :: () -> TidyIterator #foreign libtidy;

/** Given a valid TidyIterator initiated with getErrorCodeList(), returns
** an instance of the opaque type TidyMessageArgument, which serves as a token
** against which the remaining argument API functions may be used to query
** information.
** @param iter The TidyIterator (initiated with getErrorCodeList()) token.
** @result Returns a message code.
*/
getNextErrorCode :: (iter: *TidyIterator) -> u32 #foreign libtidy;

/** Tells Tidy to use a different language for output.
** @param  languageCode A Windows or POSIX language code, and must match
**         a TIDY_LANGUAGE for an installed language.
** @result Indicates that a setting was applied, but not necessarily the
**         specific request, i.e., true indicates a language and/or region
**         was applied. If es_mx is requested but not installed, and es is
**         installed, then es will be selected and this function will return
**         true. However the opposite is not true; if es is requested but
**         not present, Tidy will not try to select from the es_XX variants.
*/
setLanguage :: (languageCode: ctmbstr) -> Bool #foreign libtidy "tidySetLanguage";

/** Gets the current language used by Tidy.
** @result Returns a string indicating the currently set language.
*/
getLanguage :: () -> ctmbstr #foreign libtidy "tidyGetLanguage";

_tidyLocaleMapItem :: struct {
    _opaque: s32;
}
tidyLocaleMapItem :: *_tidyLocaleMapItem;

/** Initiates an iterator for a list of Tidy's Windows<->POSIX locale mappings.
** This iterator allows you to iterate through this list. In order to
** iterate through the list, initiate the iterator with this function, and then
** use getNextWindowsLanguage() to retrieve the first and subsequent codes.
** For example:
** @code{.c}
**   TidyIterator itList = getWindowsLanguageList();
**   while ( itList ) {
**     tidyLocaleMapItem *item = getNextWindowsLanguage( &itList );
**     // do something such as get the TidyLangWindowsName(item).
**   }
** @endcode
** @result Returns a TidyIterator, which is a token used to represent the
**         current position in a list within LibTidy.
*/
getWindowsLanguageList :: () -> TidyIterator #foreign libtidy;

/** Given a valid TidyIterator initiated with getWindowsLanguageList(), returns
** a pointer to a tidyLocaleMapItem, which can be further interrogated with
** TidyLangWindowsName() or TidyLangPosixName().
** @param iter The TidyIterator (initiated with getWindowsLanguageList()) token.
** @result Returns a pointer to a tidyLocaleMapItem.
*/
getNextWindowsLanguage :: (iter: *TidyIterator) -> *tidyLocaleMapItem #foreign libtidy;

/** Given a `tidyLocaleMapItem`, return the Windows name.
** @param item An instance of tidyLocaleMapItem to query.
** @result Returns a string with the Windows name of the mapping.
*/
TidyLangWindowsName :: (item: *tidyLocaleMapItem) -> ctmbstr #foreign libtidy;

/** Given a `tidyLocaleMapItem`, return the POSIX name.
** @param item An instance of tidyLocaleMapItem to query.
** @result Returns a string with the POSIX name of the mapping.
*/
TidyLangPosixName :: (item: *tidyLocaleMapItem) -> ctmbstr #foreign libtidy;

/** Provides a string given `messageType` in the current localization for
** `quantity`. Some strings have one or more plural forms, and this function
** will ensure that the correct singular or plural form is returned for the
** specified quantity.
** @result Returns the desired string.
*/
localizedStringN :: (messageType: u32, quantity: u32) -> ctmbstr #foreign libtidy "tidyLocalizedStringN";

/** Provides a string given `messageType` in the current localization for the
** single case.
** @param messageType The message type.
** @result Returns the desired string.
*/
localizedString :: (messageType: u32) -> ctmbstr #foreign libtidy "tidyLocalizedString";

/** Provides a string given `messageType` in the default localization (which
** is `en`).
** @param messageType The message type.
** @result Returns the desired string.
*/
defaultString :: (messageType: u32) -> ctmbstr #foreign libtidy "tidyDefaultString";

/** Initiates an iterator for a list of string key codes available in Tidy.
** This iterator allows you to iterate through all of the codes. In order to
** iterate through the codes, initiate the iterator with this function, and
** then use getNextStringKey() to retrieve the first and subsequent codes.
** For example:
** @code{.c}
**   TidyIterator itKey = getErrorCodeList();
**   while ( itKey ) {
**     uint code = getNextStringKey( &itKey );
**     // do something with the code, such as lookup a string.
**   }
** @endcode
** @remark These are provided for documentation generation purposes, and
**         probably aren't of much use to the average LibTidy implementor.
** @result Returns a TidyIterator, which is a token used to represent the
**         current position in a list within LibTidy.
*/
getStringKeyList :: () -> TidyIterator #foreign libtidy;

/** Given a valid TidyIterator initiated with getStringKeyList(), returns
** an unsigned integer representing the next key value.
** @remark These are provided for documentation generation purposes, and
**         probably aren't of much use to the average LibTidy implementor.
** @param iter The TidyIterator (initiated with getStringKeyList()) token.
** @result Returns a message code.
*/
getNextStringKey :: (iter: *TidyIterator) -> u32 #foreign libtidy;

/** Initiates an iterator for a list of Tidy's installed languages. This
** iterator allows you to iterate through this list. In order to iterate
** through the list, initiate the iterator with this function, and then use
** use getNextInstalledLanguage() to retrieve the first and subsequent strings.
** For example:
** @code{.c}
**   TidyIterator itList = getInstalledLanguageList();
**   while ( itList ) {
**     printf("%s",  getNextInstalledLanguage( &itList ));
**   }
** @endcode
** @result Returns a TidyIterator, which is a token used to represent the
**         current position in a list within LibTidy.
*/
getInstalledLanguageList :: () -> TidyIterator #foreign libtidy;

/** Given a valid TidyIterator initiated with getInstalledLanguageList(),
** returns a string representing a language name that is installed in Tidy.
** @param iter The TidyIterator (initiated with getInstalledLanguageList())
**        token.
** @result Returns a string indicating the installed language.
*/
getNextInstalledLanguage :: (iter: *TidyIterator) -> ctmbstr #foreign libtidy;

/** @name Forward declarations and typedefs.
** @{
*/
_TidyBuffer :: struct {
    allocator: *TidyAllocator; /**< Memory allocator */
    bp:        *byte; /**< Pointer to bytes */
    size:      u32; /**< Number of bytes currently in use */
    allocated: u32; /**< Number of bytes allocated */
    next:      u32; /**< Offset of current input position */
}

/** Initialize data structure using the default allocator */
bufInit :: (buf: *TidyBuffer) -> void #foreign libtidy "tidyBufInit";

/** Initialize data structure using the given custom allocator */
bufInitWithAllocator :: (buf: *TidyBuffer, allocator: *TidyAllocator) -> void #foreign libtidy "tidyBufInitWithAllocator";

/** Free current buffer, allocate given amount, reset input pointer,
use the default allocator */
bufAlloc :: (buf: *TidyBuffer, allocSize: u32) -> void #foreign libtidy "tidyBufAlloc";

/** Free current buffer, allocate given amount, reset input pointer,
use the given custom allocator */
bufAllocWithAllocator :: (buf: *TidyBuffer, allocator: *TidyAllocator, allocSize: u32) -> void #foreign libtidy "tidyBufAllocWithAllocator";

/** Expand buffer to given size.
**  Chunk size is minimum growth. Pass 0 for default of 256 bytes.
*/
bufCheckAlloc :: (buf: *TidyBuffer, allocSize: u32, chunkSize: u32) -> void #foreign libtidy "tidyBufCheckAlloc";

/** Free current contents and zero out */
bufFree :: (buf: *TidyBuffer) -> void #foreign libtidy "tidyBufFree";

/** Set buffer bytes to 0 */
bufClear :: (buf: *TidyBuffer) -> void #foreign libtidy "tidyBufClear";

/** Attach to existing buffer */
bufAttach :: (buf: *TidyBuffer, bp: *byte, size: u32) -> void #foreign libtidy "tidyBufAttach";

/** Detach from buffer.  Caller must free. */
bufDetach :: (buf: *TidyBuffer) -> void #foreign libtidy "tidyBufDetach";

/** Append bytes to buffer.  Expand if necessary. */
bufAppend :: (buf: *TidyBuffer, vp: *void, size: u32) -> void #foreign libtidy "tidyBufAppend";

/** Append one byte to buffer.  Expand if necessary. */
bufPutByte :: (buf: *TidyBuffer, bv: byte) -> void #foreign libtidy "tidyBufPutByte";

/** Get byte from end of buffer */
bufPopByte :: (buf: *TidyBuffer) -> s32 #foreign libtidy "tidyBufPopByte";

/** Get byte from front of buffer.  Increment input offset. */
bufGetByte :: (buf: *TidyBuffer) -> s32 #foreign libtidy "tidyBufGetByte";

/** At end of buffer? */
bufEndOfInput :: (buf: *TidyBuffer) -> Bool #foreign libtidy "tidyBufEndOfInput";

/** Put a byte back into the buffer.  Decrement input offset. */
bufUngetByte :: (buf: *TidyBuffer, bv: byte) -> void #foreign libtidy "tidyBufUngetByte";

/** Initialize a buffer input source */
initInputBuffer :: (inp: *TidyInputSource, buf: *TidyBuffer) -> void #foreign libtidy "tidyInitInputBuffer";

/** Initialize a buffer output sink */
initOutputBuffer :: (outp: *TidyOutputSink, buf: *TidyBuffer) -> void #foreign libtidy "tidyInitOutputBuffer";

#scope_file

#import "Basic"; // For assert


#run {
    {
        instance: _TidyIterator;
        assert(((cast(*void)(*instance._opaque)) - cast(*void)(*instance)) == 0, "_TidyIterator._opaque has unexpected offset % instead of 0", ((cast(*void)(*instance._opaque)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyIterator._opaque)) == 4, "_TidyIterator._opaque has unexpected size % instead of 4", size_of(type_of(_TidyIterator._opaque)));
        assert(size_of(_TidyIterator) == 4, "_TidyIterator has size % instead of 4", size_of(_TidyIterator));
    }

    {
        instance: _TidyDoc;
        assert(((cast(*void)(*instance._opaque)) - cast(*void)(*instance)) == 0, "_TidyDoc._opaque has unexpected offset % instead of 0", ((cast(*void)(*instance._opaque)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyDoc._opaque)) == 4, "_TidyDoc._opaque has unexpected size % instead of 4", size_of(type_of(_TidyDoc._opaque)));
        assert(size_of(_TidyDoc) == 4, "_TidyDoc has size % instead of 4", size_of(_TidyDoc));
    }

    {
        instance: _TidyOption;
        assert(((cast(*void)(*instance._opaque)) - cast(*void)(*instance)) == 0, "_TidyOption._opaque has unexpected offset % instead of 0", ((cast(*void)(*instance._opaque)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyOption._opaque)) == 4, "_TidyOption._opaque has unexpected size % instead of 4", size_of(type_of(_TidyOption._opaque)));
        assert(size_of(_TidyOption) == 4, "_TidyOption has size % instead of 4", size_of(_TidyOption));
    }

    {
        instance: _TidyNode;
        assert(((cast(*void)(*instance._opaque)) - cast(*void)(*instance)) == 0, "_TidyNode._opaque has unexpected offset % instead of 0", ((cast(*void)(*instance._opaque)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyNode._opaque)) == 4, "_TidyNode._opaque has unexpected size % instead of 4", size_of(type_of(_TidyNode._opaque)));
        assert(size_of(_TidyNode) == 4, "_TidyNode has size % instead of 4", size_of(_TidyNode));
    }

    {
        instance: _TidyAttr;
        assert(((cast(*void)(*instance._opaque)) - cast(*void)(*instance)) == 0, "_TidyAttr._opaque has unexpected offset % instead of 0", ((cast(*void)(*instance._opaque)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyAttr._opaque)) == 4, "_TidyAttr._opaque has unexpected size % instead of 4", size_of(type_of(_TidyAttr._opaque)));
        assert(size_of(_TidyAttr) == 4, "_TidyAttr has size % instead of 4", size_of(_TidyAttr));
    }

    {
        instance: _TidyMessage;
        assert(((cast(*void)(*instance._opaque)) - cast(*void)(*instance)) == 0, "_TidyMessage._opaque has unexpected offset % instead of 0", ((cast(*void)(*instance._opaque)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyMessage._opaque)) == 4, "_TidyMessage._opaque has unexpected size % instead of 4", size_of(type_of(_TidyMessage._opaque)));
        assert(size_of(_TidyMessage) == 4, "_TidyMessage has size % instead of 4", size_of(_TidyMessage));
    }

    {
        instance: _TidyMessageArgument;
        assert(((cast(*void)(*instance._opaque)) - cast(*void)(*instance)) == 0, "_TidyMessageArgument._opaque has unexpected offset % instead of 0", ((cast(*void)(*instance._opaque)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyMessageArgument._opaque)) == 4, "_TidyMessageArgument._opaque has unexpected size % instead of 4", size_of(type_of(_TidyMessageArgument._opaque)));
        assert(size_of(_TidyMessageArgument) == 4, "_TidyMessageArgument has size % instead of 4", size_of(_TidyMessageArgument));
    }

    {
        instance: _TidyAllocator;
        assert(((cast(*void)(*instance.vtbl)) - cast(*void)(*instance)) == 0, "_TidyAllocator.vtbl has unexpected offset % instead of 0", ((cast(*void)(*instance.vtbl)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyAllocator.vtbl)) == 8, "_TidyAllocator.vtbl has unexpected size % instead of 8", size_of(type_of(_TidyAllocator.vtbl)));
        assert(size_of(_TidyAllocator) == 8, "_TidyAllocator has size % instead of 8", size_of(_TidyAllocator));
    }

    {
        instance: _TidyAllocatorVtbl;
        assert(((cast(*void)(*instance.alloc)) - cast(*void)(*instance)) == 0, "_TidyAllocatorVtbl.alloc has unexpected offset % instead of 0", ((cast(*void)(*instance.alloc)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyAllocatorVtbl.alloc)) == 8, "_TidyAllocatorVtbl.alloc has unexpected size % instead of 8", size_of(type_of(_TidyAllocatorVtbl.alloc)));
        assert(((cast(*void)(*instance.realloc)) - cast(*void)(*instance)) == 8, "_TidyAllocatorVtbl.realloc has unexpected offset % instead of 8", ((cast(*void)(*instance.realloc)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyAllocatorVtbl.realloc)) == 8, "_TidyAllocatorVtbl.realloc has unexpected size % instead of 8", size_of(type_of(_TidyAllocatorVtbl.realloc)));
        assert(((cast(*void)(*instance.free)) - cast(*void)(*instance)) == 16, "_TidyAllocatorVtbl.free has unexpected offset % instead of 16", ((cast(*void)(*instance.free)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyAllocatorVtbl.free)) == 8, "_TidyAllocatorVtbl.free has unexpected size % instead of 8", size_of(type_of(_TidyAllocatorVtbl.free)));
        assert(((cast(*void)(*instance.panic)) - cast(*void)(*instance)) == 24, "_TidyAllocatorVtbl.panic has unexpected offset % instead of 24", ((cast(*void)(*instance.panic)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyAllocatorVtbl.panic)) == 8, "_TidyAllocatorVtbl.panic has unexpected size % instead of 8", size_of(type_of(_TidyAllocatorVtbl.panic)));
        assert(size_of(_TidyAllocatorVtbl) == 32, "_TidyAllocatorVtbl has size % instead of 32", size_of(_TidyAllocatorVtbl));
    }

    {
        instance: _TidyInputSource;
        assert(((cast(*void)(*instance.sourceData)) - cast(*void)(*instance)) == 0, "_TidyInputSource.sourceData has unexpected offset % instead of 0", ((cast(*void)(*instance.sourceData)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyInputSource.sourceData)) == 8, "_TidyInputSource.sourceData has unexpected size % instead of 8", size_of(type_of(_TidyInputSource.sourceData)));
        assert(((cast(*void)(*instance.getByte)) - cast(*void)(*instance)) == 8, "_TidyInputSource.getByte has unexpected offset % instead of 8", ((cast(*void)(*instance.getByte)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyInputSource.getByte)) == 8, "_TidyInputSource.getByte has unexpected size % instead of 8", size_of(type_of(_TidyInputSource.getByte)));
        assert(((cast(*void)(*instance.ungetByte)) - cast(*void)(*instance)) == 16, "_TidyInputSource.ungetByte has unexpected offset % instead of 16", ((cast(*void)(*instance.ungetByte)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyInputSource.ungetByte)) == 8, "_TidyInputSource.ungetByte has unexpected size % instead of 8", size_of(type_of(_TidyInputSource.ungetByte)));
        assert(((cast(*void)(*instance.eof)) - cast(*void)(*instance)) == 24, "_TidyInputSource.eof has unexpected offset % instead of 24", ((cast(*void)(*instance.eof)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyInputSource.eof)) == 8, "_TidyInputSource.eof has unexpected size % instead of 8", size_of(type_of(_TidyInputSource.eof)));
        assert(size_of(_TidyInputSource) == 32, "_TidyInputSource has size % instead of 32", size_of(_TidyInputSource));
    }

    {
        instance: _TidyOutputSink;
        assert(((cast(*void)(*instance.sinkData)) - cast(*void)(*instance)) == 0, "_TidyOutputSink.sinkData has unexpected offset % instead of 0", ((cast(*void)(*instance.sinkData)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyOutputSink.sinkData)) == 8, "_TidyOutputSink.sinkData has unexpected size % instead of 8", size_of(type_of(_TidyOutputSink.sinkData)));
        assert(((cast(*void)(*instance.putByte)) - cast(*void)(*instance)) == 8, "_TidyOutputSink.putByte has unexpected offset % instead of 8", ((cast(*void)(*instance.putByte)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyOutputSink.putByte)) == 8, "_TidyOutputSink.putByte has unexpected size % instead of 8", size_of(type_of(_TidyOutputSink.putByte)));
        assert(size_of(_TidyOutputSink) == 16, "_TidyOutputSink has size % instead of 16", size_of(_TidyOutputSink));
    }

    {
        instance: _tidyLocaleMapItem;
        assert(((cast(*void)(*instance._opaque)) - cast(*void)(*instance)) == 0, "_tidyLocaleMapItem._opaque has unexpected offset % instead of 0", ((cast(*void)(*instance._opaque)) - cast(*void)(*instance)));
        assert(size_of(type_of(_tidyLocaleMapItem._opaque)) == 4, "_tidyLocaleMapItem._opaque has unexpected size % instead of 4", size_of(type_of(_tidyLocaleMapItem._opaque)));
        assert(size_of(_tidyLocaleMapItem) == 4, "_tidyLocaleMapItem has size % instead of 4", size_of(_tidyLocaleMapItem));
    }

    {
        instance: _TidyBuffer;
        assert(((cast(*void)(*instance.allocator)) - cast(*void)(*instance)) == 0, "_TidyBuffer.allocator has unexpected offset % instead of 0", ((cast(*void)(*instance.allocator)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyBuffer.allocator)) == 8, "_TidyBuffer.allocator has unexpected size % instead of 8", size_of(type_of(_TidyBuffer.allocator)));
        assert(((cast(*void)(*instance.bp)) - cast(*void)(*instance)) == 8, "_TidyBuffer.bp has unexpected offset % instead of 8", ((cast(*void)(*instance.bp)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyBuffer.bp)) == 8, "_TidyBuffer.bp has unexpected size % instead of 8", size_of(type_of(_TidyBuffer.bp)));
        assert(((cast(*void)(*instance.size)) - cast(*void)(*instance)) == 16, "_TidyBuffer.size has unexpected offset % instead of 16", ((cast(*void)(*instance.size)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyBuffer.size)) == 4, "_TidyBuffer.size has unexpected size % instead of 4", size_of(type_of(_TidyBuffer.size)));
        assert(((cast(*void)(*instance.allocated)) - cast(*void)(*instance)) == 20, "_TidyBuffer.allocated has unexpected offset % instead of 20", ((cast(*void)(*instance.allocated)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyBuffer.allocated)) == 4, "_TidyBuffer.allocated has unexpected size % instead of 4", size_of(type_of(_TidyBuffer.allocated)));
        assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 24, "_TidyBuffer.next has unexpected offset % instead of 24", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
        assert(size_of(type_of(_TidyBuffer.next)) == 4, "_TidyBuffer.next has unexpected size % instead of 4", size_of(type_of(_TidyBuffer.next)));
        assert(size_of(_TidyBuffer) == 32, "_TidyBuffer has size % instead of 32", size_of(_TidyBuffer));
    }
}


#if OS == .MACOS    libtidy :: #library "macos/libtidy";
#if OS == .LINUX    libtidy :: #library "linux/lib/libtidy";

