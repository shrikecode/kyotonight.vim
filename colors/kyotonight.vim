" Copyright (C) 2022-present Wojciech M. Wnuk <laniusone@pm.me>

" Project: Kyoto Night Vim
" Repository: https://github.com/laniusone/kyotonight.vim
" License: MIT

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "kyotonight"
let s:kyotonight_vim_version="0.1.0"
set background=dark

let s:none        = ["", ""]
let s:cl          = ["#292e42", ""]
let s:hl          = ["#33467c", "7"]
let s:black0      = ["#0f0f14", ""]
let s:bg          = ["#1a1b26", "0"]
let s:black1      = ["#24283b", "8"]
let s:grey0       = ["#414868", "7"]
let s:grey1       = ["#565f89", "15"]
let s:fg          = ["#a9b1d6", ""]
let s:cream       = ["#cfc9c2", "15"]
let s:cyan1       = ["#b4f9f8", "14"]
let s:teal        = ["#73daca", "6"]
let s:blue1       = ["#7dcfff", "12"]
let s:blue0       = ["#7aa2f7", "4"]
let s:cyan0       = ["#2ac3de", "6"]
let s:red         = ["#f7768e", "1"]
let s:orange      = ["#ff9e64", "3"]
let s:yellow      = ["#e0af68", "11"]
let s:green       = ["#9ece6a", "2"]
let s:magenta     = ["#bb9af7", "5"]

let g:kyotonight_bold = get(g:, "kyotonight_bold", 1)
let s:bold = (g:kyotonight_bold == 0) ? "" : "bold,"

let g:kyotonight_underline = get(g:, "kyotonight_underline", 1)
let s:underline = (g:kyotonight_underline == 0) ? "NONE," : "underline,"

let g:kyotonight_italic = get(g:, "kyotonight_italic", (has("gui_running") || $TERM_ITALICS == "true"))
let s:italic = (g:kyotonight_italic == 0) ? "" : "italic,"

let g:kyotonight_italic_comments = get(g:, "kyotonight_italic_comments", 0)
let s:italicize_comments = (g:kyotonight_italic_comments == 0) ? "" : get(s:, "italic")

let g:kyotonight_uniform_status_lines = get(g:, "kyotonight_uniform_status_lines", 0)

let g:kyotonight_bold_vertical_split_line = get(g:, "kyotonight_bold_vertical_split_line", 0)

let g:kyotonight_cursor_line_number_background = get(g:, "kyotonight_cursor_line_number_background", 0)
let g:kyotonight_uniform_diff_background = get(g:, "kyotonight_uniform_diff_background", 0)

function! s:hi(group, fg, bg, attr, guisp)
  let cmd = ""
  if type(a:fg) == v:t_list && a:fg[0] != ""
    let cmd = cmd . " guifg=" . a:fg[0]
  endif
  if type(a:bg) == v:t_list && a:bg[0] != ""
    let cmd = cmd . " guibg=" . a:bg[0]
  endif
  if type(a:fg) == v:t_list && a:fg[1] != ""
    let cmd = cmd . " ctermfg=" . a:fg[1]
  endif
  if type(a:bg) == v:t_list && a:bg[1] != ""
    let cmd = cmd . " ctermbg=" . a:bg[1]
  endif
  if a:attr != ""
    let cmd = cmd . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if type(a:guisp) == v:t_list && a:guisp[0] != ""
    let cmd = cmd . " guisp=" . a:guisp[0]
  endif
  if cmd != ""
    exec "hi " . a:group . cmd
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", s:bold, "")
call s:hi("Italic", "", "", s:italic, "")
call s:hi("Underline", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:black1, "", "")
call s:hi("Cursor", s:bg, s:fg, "", "")
call s:hi("CursorLine", "", s:cl, "NONE", "")
call s:hi("Error", s:bg, s:red, "", "")
call s:hi("iCursor", s:black0, s:fg, "", "")
call s:hi("LineNr", s:grey0, "NONE", "", "")
call s:hi("MatchParen", s:blue1, s:grey0, "", "")
call s:hi("NonText", s:grey1, "", "", "")
call s:hi("Normal", s:fg, s:bg, "", "")
call s:hi("Pmenu", s:fg, s:black1, "NONE", "")
call s:hi("PmenuSbar", s:fg, s:black1, "", "")
call s:hi("PmenuSel", s:blue1, s:grey0, "", "")
call s:hi("PmenuThumb", s:blue1, s:grey0, "", "")
call s:hi("SpecialKey", s:grey0, "", "", "")
call s:hi("SpellBad", s:red, s:bg, "undercurl", s:red)
call s:hi("SpellCap", s:orange, s:bg, "undercurl", s:orange)
call s:hi("SpellLocal", s:yellow, s:bg, "undercurl", s:yellow)
call s:hi("SpellRare", s:cyan1, s:bg, "undercurl", s:cyan1)
call s:hi("Visual", "", s:hl, "", "")
call s:hi("VisualNOS", "", s:hl, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [s:bg[0], s:red[0], s:green[0], s:yellow[0], s:blue0[0], s:magenta[0], s:blue1[0], s:cream[0], s:grey0[0], s:red[0], s:green[0], s:yellow[0], s:blue0[0], s:magenta[0], s:teal[0], s:cyan1[0]]
endif

if has('nvim')
  "+- Neovim Terminal Colors -+
  let g:terminal_color_0 = s:bg[0]
  let g:terminal_color_1 = s:red[0]
  let g:terminal_color_2 = s:green[0]
  let g:terminal_color_3 = s:yellow[0]
  let g:terminal_color_4 = s:blue0[0]
  let g:terminal_color_5 = s:magenta[0]
  let g:terminal_color_6 = s:blue1[0]
  let g:terminal_color_7 = s:cream[0]
  let g:terminal_color_8 = s:grey0[0]
  let g:terminal_color_9 = s:red[0]
  let g:terminal_color_10 = s:green[0]
  let g:terminal_color_11 = s:yellow[0]
  let g:terminal_color_12 = s:blue0[0]
  let g:terminal_color_13 = s:magenta[0]
  let g:terminal_color_14 = s:teal[0]
  let g:terminal_color_15 = s:cyan1[0]

  "+- Neovim Support -+
  call s:hi("healthError", s:red, s:bg, "", "")
  call s:hi("healthSuccess", s:green, s:bg, "", "")
  call s:hi("healthWarning", s:yellow, s:bg, "", "")
  call s:hi("TermCursorNC", "", s:bg, "", "")

  "+- Neovim Diagnostics API -+
  call s:hi("DiagnosticWarn", s:yellow, "", "", "")
  call s:hi("DiagnosticError", s:red, "", "", "")
  call s:hi("DiagnosticInfo", s:blue0, "", "", "")
  call s:hi("DiagnosticHint", s:cyan1, "", "", "")
  call s:hi("DiagnosticSignWarn", s:yellow, "", "", "")
  call s:hi("DiagnosticSignError", s:red, "", "", "")
  call s:hi("DiagnosticSignInfo", s:blue0, "", "", "")
  call s:hi("DiagnosticSignHint", s:cyan1, "", "", "")
  call s:hi("DiagnosticUnderlineWarn", s:yellow, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineError", s:red, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineInfo", s:blue0, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineHint", s:cyan1, "", "undercurl", "")

  "+- Neovim DocumentHighlight -+
  call s:hi("LspReferenceText", "", s:grey0, "", "")
  call s:hi("LspReferenceRead", "", s:grey0, "", "")
  call s:hi("LspReferenceWrite", "", s:grey0, "", "")

  "+- Neovim LspSignatureHelp -+
  call s:hi("LspSignatureActiveParameter", s:blue0, "", s:underline, "")
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:bg, "", "")
if g:kyotonight_cursor_line_number_background == 0
  call s:hi("CursorLineNr", s:fg, "", "NONE", "")
else
  call s:hi("CursorLineNr", s:fg, s:black0, "NONE", "")
endif
call s:hi("Folded", s:grey0, s:bg, s:bold, "")
call s:hi("FoldColumn", s:grey0, s:bg, "", "")
call s:hi("SignColumn", s:bg, s:bg, "", "")

"+--- Navigation ---+
call s:hi("Directory", s:blue0, "", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:bg, "", "", "")
call s:hi("ErrorMsg", s:bg, s:red, "", "")
call s:hi("ModeMsg", s:fg, "", "", "")
call s:hi("MoreMsg", s:blue0, "", "", "")
call s:hi("Question", s:fg, "", "", "")
if g:kyotonight_uniform_status_lines == 0
  call s:hi("StatusLine", s:blue0, s:grey0, "NONE", "")
  call s:hi("StatusLineNC", s:fg, s:bg, "NONE", "")
  call s:hi("StatusLineTerm", s:blue0, s:grey0, "NONE", "")
  call s:hi("StatusLineTermNC", s:fg, s:bg, "NONE", "")
else
  call s:hi("StatusLine", s:blue0, s:grey0, "NONE", "")
  call s:hi("StatusLineNC", s:fg, s:grey0, "NONE", "")
  call s:hi("StatusLineTerm", s:blue0, s:grey0, "NONE", "")
  call s:hi("StatusLineTermNC", s:fg, s:grey0, "NONE", "")
endif
call s:hi("WarningMsg", s:bg, s:yellow, "", "")
call s:hi("WildMenu", s:blue0, s:bg, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:cyan1, s:blue0, s:underline, "")
call s:hi("Search", s:bg, s:blue0, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:fg, s:bg, "NONE", "")
call s:hi("TabLineFill", s:grey0, s:bg, "NONE", "")
call s:hi("TabLineSel", s:grey1, s:bg, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:fg, "", "NONE", "")
call s:hi("VertSplit", s:black0, s:black0, "NONE", "")
hi! link WinSeparator VertSplit

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:orange, "", "", "")
call s:hi("Character", s:green, "", "", "")
call s:hi("Comment", s:grey1, "", s:italicize_comments, "")
call s:hi("Conceal", "", "NONE", "", "")
call s:hi("Conditional", s:magenta, "", "", "")
call s:hi("Constant", s:cream, "", s:italic, "")
call s:hi("Decorator", s:orange, "", "", "")
call s:hi("Define", s:blue0, "", "", "")
call s:hi("Delimiter", s:blue0, "", "", "")
call s:hi("Exception", s:magenta, "", "", "") 
call s:hi("Float", s:orange, "", "", "")
call s:hi("Function", s:blue1, "", "", "")
call s:hi("Identifier", s:blue0, "", s:italic, "")
call s:hi("Variable", s:fg, "", "", "")
call s:hi("Include", s:blue1, "", "", "") 
call s:hi("Keyword", s:blue0, "", "", "")
call s:hi("Label", s:blue0, "", "", "")
call s:hi("Number", s:orange, "", "", "")
call s:hi("Operator", s:magenta, "", "NONE", "")
call s:hi("PreProc", s:blue0, "", "NONE", "")
call s:hi("Repeat", s:magenta, "", "", "")
call s:hi("Special", s:blue0, "", "", "")
call s:hi("SpecialChar", s:yellow, "", "", "")
call s:hi("SpecialComment", s:blue1, "", s:italicize_comments, "")
call s:hi("Statement", s:blue0, "", "", "")
call s:hi("StorageClass", s:blue0, "", "", "")
call s:hi("String", s:green, "", "", "")
call s:hi("Structure", s:magenta, "", "", "") 
call s:hi("Tag", s:fg, "", "", "")
call s:hi("Todo", s:yellow, "NONE", "", "")
call s:hi("Type", s:teal, "", "NONE", "")
call s:hi("Typedef", s:teal, "", "", "")
hi! link Annotation Decorator
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:cyan0, "", "", "")
call s:hi("asciidocAttributeList", s:cyan0, "", "", "")
call s:hi("asciidocAttributeRef", s:cyan0, "", "", "")
call s:hi("asciidocHLabel", s:blue0, "", "", "")
call s:hi("asciidocListingBlock", s:teal, "", "", "")
call s:hi("asciidocMacroAttributes", s:blue1, "", "", "")
call s:hi("asciidocOneLineTitle", s:blue1, "", "", "")
call s:hi("asciidocPassthroughBlock", s:blue0, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:teal, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:teal, "", "", "")
hi! link asciidocAdmonition Keyword
hi! link asciidocAttributeRef markdownH1
hi! link asciidocBackslash Keyword
hi! link asciidocMacro Keyword
hi! link asciidocQuotedBold Bold
hi! link asciidocQuotedEmphasized Italic
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownLinkText

call s:hi("awkCharClass", s:teal, "", "", "")
call s:hi("awkPatterns", s:blue0, "", s:bold, "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", s:teal, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit
hi! link cConstant Type

call s:hi("cmakeGeneratorExpression", s:cyan0, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:teal, "", "", "")
call s:hi("cssDefinition", s:teal, "", "NONE", "")
call s:hi("cssIdentifier", s:teal, "", s:underline, "")
call s:hi("cssStringQ", s:teal, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:blue1, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:teal, "", "", "")
call s:hi("dtExecKey", s:teal, "", "", "")
call s:hi("dtLocaleKey", s:teal, "", "", "")
call s:hi("dtNumericKey", s:teal, "", "", "")
call s:hi("dtTypeKey", s:teal, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:kyotonight_uniform_diff_background == 0
  call s:hi("DiffAdd", s:green, s:black0, "inverse", "")
  call s:hi("DiffChange", s:yellow, s:black0, "inverse", "")
  call s:hi("DiffDelete", s:red, s:black0, "inverse", "")
  call s:hi("DiffText", s:blue0, s:black0, "inverse", "")
else
  call s:hi("DiffAdd", s:green, s:bg, "", "")
  call s:hi("DiffChange", s:yellow, s:bg, "", "")
  call s:hi("DiffDelete", s:red, s:bg, "", "")
  call s:hi("DiffText", s:blue0, s:bg, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:teal, "", "", "")

call s:hi("goBuiltins", s:teal, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:grey0, "", "", "")
call s:hi("helpHyperTextJump", s:blue1, "", s:underline, "")

call s:hi("htmlArg", s:teal, "", "", "")
call s:hi("htmlLink", s:fg, "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:teal, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:teal, "", "", "")

call s:hi("lessClass", s:teal, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:teal, "", "", "")
call s:hi("markdownCode", s:teal, "", "", "")
call s:hi("markdownCodeDelimiter", s:teal, "", "", "")
call s:hi("markdownFootnote", s:teal, "", "", "")
call s:hi("markdownId", s:teal, "", "", "")
call s:hi("markdownIdDeclaration", s:teal, "", "", "")
call s:hi("markdownH1", s:blue1, "", "", "")
call s:hi("markdownLinkText", s:blue1, "", "", "")
call s:hi("markdownUrl", s:fg, "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:teal, "", "", "")

call s:hi("phpClasses", s:teal, "", "", "")
call s:hi("phpDocTags", s:teal, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:teal, "", "", "")
call s:hi("podVerbatimLine", s:fg, "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:teal, "", "", "")
call s:hi("rubySymbol", s:cyan1, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", s:cyan0, "", "", "")
call s:hi("rustEnum", s:teal, "", s:bold, "")
call s:hi("rustMacro", s:blue1, "", s:bold, "")
call s:hi("rustModPath", s:teal, "", "", "")
call s:hi("rustPanic", s:blue0, "", s:bold, "")
call s:hi("rustTrait", s:teal, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", s:teal, "", "", "")
call s:hi("sassId", s:teal, "", s:underline, "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:teal, "", "", "")
call s:hi("vimMapRhs", s:teal, "", "", "")
call s:hi("vimNotation", s:teal, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:teal, "", "", "")
call s:hi("xmlCdataStart", s:grey1, "", s:bold, "")
call s:hi("xmlNamespace", s:teal, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:teal, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:yellow, "", "", "")
call s:hi("ALEErrorSign", s:red, "", "", "")
call s:hi("ALEWarning", s:yellow, "", "undercurl", "")
call s:hi("ALEError", s:red, "", "undercurl", "")

" Coc
" > neoclide/coc.nvim
call s:hi("CocWarningHighlight", s:yellow, "", "undercurl", "")
call s:hi("CocErrorHighlight", s:red, "", "undercurl", "")
call s:hi("CocInfoHighlight", s:blue1, "", "undercurl", "")
call s:hi("CocHintHighlight", s:blue0, "", "undercurl", "")
call s:hi("CocWarningSign", s:yellow, "", "", "")
call s:hi("CocErrorSign", s:red, "", "", "")
call s:hi("CocInfoSign", s:blue1, "", "", "")
call s:hi("CocHintSign", s:blue0, "", "", "")
call s:hi("CocSearch", s:blue1, "", "", "")
call s:hi("CocNotificationProgress", s:blue1, "", "", "")

if has('nvim')
  " Neovim LSP
  " > neovim/nvim-lspconfig
  call s:hi("LspCodeLens", s:grey1, "", "", "")
  if has("nvim-0.5")
    call s:hi("LspDiagnosticsDefaultWarning", s:yellow, "", "", "")
    call s:hi("LspDiagnosticsDefaultError", s:red, "", "", "")
    call s:hi("LspDiagnosticsDefaultInformation", s:blue1, "", "", "")
    call s:hi("LspDiagnosticsDefaultHint", s:blue0, "", "", "")
    call s:hi("LspDiagnosticsUnderlineWarning", s:yellow, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineError", s:red, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineInformation", s:blue1, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineHint", s:blue0, "", "undercurl", "")
  endif
  
  " Gitsigns
  " > lewis6991/gitsigns.nvim
  hi! link GitSignsCurrentLineBlame Comment
endif

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:green, "", "", "")
call s:hi("GitGutterChange", s:yellow, "", "", "")
call s:hi("GitGutterChangeDelete", s:red, "", "", "")
call s:hi("GitGutterDelete", s:red, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:green, "", "", "")
call s:hi("SignifySignChange", s:yellow, "", "", "")
call s:hi("SignifySignChangeDelete", s:red, "", "", "")
call s:hi("SignifySignDelete", s:red, "", "", "")

" Sneak
" > justinmk/vim-sneak
hi! link Sneak Search

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:red, "", "", "")
call s:hi("gitcommitUntrackedFile", s:red, "", "", "")
call s:hi("gitcommitSelectedFile", s:green, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:fg, s:grey0, "", "")
call s:hi("jediFat", s:blue1, s:grey0, s:underline.s:bold, "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:teal, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-clap
" > liuchengxu/vim-clap
call s:hi("ClapDir", s:fg, "", "", "")
call s:hi("ClapDisplay", s:fg, s:bg, "", "")
call s:hi("ClapFile", s:fg, "", "", "")
call s:hi("ClapMatches", s:blue1, "", "", "")
call s:hi("ClapNoMatchesFound", s:yellow, "", "", "")
call s:hi("ClapSelected", s:teal, "", s:bold, "")
call s:hi("ClapSelectedSign", s:blue0, "", "", "")
let s:clap_matches = [
        \ [s:blue1[0], s:blue1[1]] ,
        \ [s:blue0[0], s:blue0[1]] ,
        \ [s:cyan0[0], s:cyan0[1]] ,
        \ ]
for s:clap_match_i in range(1,12)
  let clap_match_color = s:clap_matches[s:clap_match_i % len(s:clap_matches) - 1]
  call s:hi("ClapMatches" . s:clap_match_i, [clap_match_color[0], ""], [clap_match_color[1], ""], "", "")
  call s:hi("ClapFuzzyMatches" . s:clap_match_i, [clap_match_color[0], ""], [clap_match_color[1], ""], "", "")
endfor
unlet s:clap_match_i
hi! link ClapCurrentSelection PmenuSel
hi! link ClapCurrentSelectionSign ClapSelectedSign
hi! link ClapInput Pmenu
hi! link ClapPreview Pmenu
hi! link ClapProviderAbout ClapDisplay
hi! link ClapProviderColon Type
hi! link ClapProviderId Type

" vim-indent-guides
" > nathanaelkane/vim-indent-guides
call s:hi("IndentGuidesEven", "", s:bg, "", "")
call s:hi("IndentGuidesOdd", "", s:black1, "", "")

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:red, "", "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", s:blue1, "", "", "")

" vim-startify
" > mhinz/vim-startify
call s:hi("StartifyFile", s:cyan1, "", "", "")
call s:hi("StartifyFooter", s:teal, "", "", "")
call s:hi("StartifyHeader", s:blue1, "", "", "")
call s:hi("StartifyNumber", s:teal, "", "", "")
call s:hi("StartifyPath", s:blue1, "", "", "")
hi! link StartifyBracket Delimiter
hi! link StartifySlash Normal
hi! link StartifySpecial Comment

" dashboard-nvim
" > glepnir/dashboard-nvim
call s:hi("DashboardHeader", s:blue0, "", "", "")
call s:hi("DashboardCenter", s:magenta, "", "", "")
call s:hi("DashboardFooter", s:yellow, "", s:italic, "")
call s:hi("DashboardShortCut", s:teal, "", "", "")

" nvim-tree.lua
" > nvim-tree/nvim-tree.lua
call s:hi("NvimTreeNormal", s:fg, s:black0, "", "")
call s:hi("NvimTreeWinSeparator", s:black0, s:black0, "", "")
call s:hi("NvimTreeNormalNC", s:fg, s:black0, "", "")
call s:hi("NvimTreeRootFolder", s:magenta, s:black0, s:bold, "")

" barbar.nvim
" > romgrk/barbar.nvim
call s:hi("BufferCurrentMod", s:yellow, s:bg, "", "")
call s:hi("BufferVisibleMod", s:yellow, s:grey0, "", "")
call s:hi("BufferInactiveMod", s:yellow, s:black0, "", "")

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi("haskellPreProc", s:cyan0, "", "", "")
call s:hi("haskellType", s:teal, "", "", "")
hi! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:blue1, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Pandoc
" > vim-pandoc/vim-pandoc-syntax
call s:hi("pandocDefinitionBlockTerm", s:teal, "", s:italic, "")
call s:hi("pandocTableDelims", s:grey0, "", "", "")
hi! link pandocAtxHeader markdownH1
hi! link pandocBlockQuote markdownBlockquote
hi! link pandocCiteAnchor Operator
hi! link pandocCiteKey pandocReferenceLabel
hi! link pandocDefinitionBlockMark Operator
hi! link pandocEmphasis markdownItalic
hi! link pandocFootnoteID pandocReferenceLabel
hi! link pandocFootnoteIDHead markdownLinkDelimiter
hi! link pandocFootnoteIDTail pandocFootnoteIDHead
hi! link pandocGridTableDelims pandocTableDelims
hi! link pandocGridTableHeader pandocTableDelims
hi! link pandocOperator Operator
hi! link pandocPipeTableDelims pandocTableDelims
hi! link pandocReferenceDefinition pandocReferenceLabel
hi! link pandocReferenceLabel markdownLinkText
hi! link pandocReferenceURL markdownUrl
hi! link pandocSimpleTableHeader pandocAtxHeader
hi! link pandocStrong markdownBold
hi! link pandocTableHeaderWord pandocAtxHeader
hi! link pandocUListItemBullet Operator
  
if has('nvim')
  " tree-sitter
  " > nvim-treesitter/nvim-treesitter
  hi! link TSAnnotation Annotation
  hi! link TSConstBuiltin Constant
  hi! link TSConstructor Identifier
  hi! link TSEmphasis Italic
  hi! link TSFuncBuiltin Function
  hi! link TSFuncMacro Function
  hi! link TSStringRegex SpecialChar
  hi! link TSStrong Bold
  hi! link TSStructure Structure
  hi! link TSTagDelimiter TSTag
  hi! link TSUnderline Underline
  hi! link TSVariable Variable
  hi! link TSVariableBuiltin Function
endif

" TypeScript
" > HerringtonDarkholme/yats.vim
call s:hi("typescriptBOMWindowMethod", s:blue1, "", s:italic, "")
call s:hi("typescriptClassName", s:teal, "", "", "")
call s:hi("typescriptDecorator", s:orange, "", "", "")
call s:hi("typescriptInterfaceName", s:teal, "", s:bold, "")
call s:hi("typescriptRegexpString", s:yellow, "", "", "")
" TypeScript JSX
call s:hi("tsxAttrib", s:teal, "", "", "")
hi! link typescriptOperator Operator
hi! link typescriptBinaryOp Operator
hi! link typescriptAssign Operator
hi! link typescriptMember Identifier
hi! link typescriptDOMStorageMethod Identifier
hi! link typescriptArrowFuncArg Identifier
hi! link typescriptGlobal typescriptClassName
hi! link typescriptBOMWindowProp Function
hi! link typescriptArrowFuncDef Function
hi! link typescriptAliasDeclaration Function
hi! link typescriptPredefinedType Type
hi! link typescriptTypeReference typescriptClassName
hi! link typescriptTypeAnnotation Structure
hi! link typescriptDocNamedParamType SpecialComment
hi! link typescriptDocNotation Keyword
hi! link typescriptDocTags Keyword
hi! link typescriptImport Keyword
hi! link typescriptExport Keyword
hi! link typescriptTry Keyword
hi! link typescriptVariable Keyword
hi! link typescriptBraces Normal
hi! link typescriptObjectLabel Normal
hi! link typescriptCall Normal
hi! link typescriptClassHeritage typescriptClassName
hi! link typescriptFuncTypeArrow Structure
hi! link typescriptMemberOptionality Structure
hi! link typescriptNodeGlobal typescriptGlobal
hi! link typescriptTypeBrackets Structure
hi! link tsxEqual Operator
hi! link tsxIntrinsicTagName htmlTag
hi! link tsxTagName tsxIntrinsicTagName

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:teal, "", "", "")
call s:hi("mkdFootnote", s:blue1, "", "", "")
call s:hi("mkdRule", s:cyan0, "", "", "")
call s:hi("mkdLineBreak", s:blue0, "", "", "")
hi! link mkdBold Bold
hi! link mkdItalic Italic
hi! link mkdString Keyword
hi! link mkdCodeStart mkdCode
hi! link mkdCodeEnd mkdCode
hi! link mkdBlockquote Comment
hi! link mkdListItem Keyword
hi! link mkdListItemLine Normal
hi! link mkdFootnotes mkdFootnote
hi! link mkdLink markdownLinkText
hi! link mkdURL markdownUrl
hi! link mkdInlineURL mkdURL
hi! link mkdID Identifier
hi! link mkdLinkDef mkdLink
hi! link mkdLinkDefTarget mkdURL
hi! link mkdLinkTitle mkdInlineURL
hi! link mkdDelimiter Keyword

" PHP
" > StanAngeloff/php.vim
call s:hi("phpClass", s:teal, "", "", "")
call s:hi("phpClassImplements", s:teal, "", s:bold, "")
hi! link phpClassExtends phpClass
hi! link phpFunction Function
hi! link phpMethod Function
hi! link phpUseClass phpClass

" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:blue1, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolorfg = [s:teal[0], s:blue1[0], s:blue0[0], s:cyan0[0], s:green[0], s:magenta[0]]
  let s:vimwiki_hcolor_ctermfg = [s:teal[1], s:blue1[1], s:blue0[1], s:cyan0[1], s:green[1], s:magenta[1]]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, [s:vimwiki_hcolorfg[s:i-1] , ""], [s:vimwiki_hcolor_ctermfg[s:i-1], ""], s:bold, "")
  endfor
endif
call s:hi("VimwikiLink", s:blue1, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:teal, "", "", "")

