" Copyright (C) 2022-present Wojciech M. Wnuk <laniusone@pm.me>

" Project: Kyoto Night Vim
" Repository: https://github.com/voidekh/kyotonight.vim
" License: MIT

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "kyotonight"
let s:kyotonight_vim_version="0.3.1"
set background=dark

let g:kyotonight#none        = get(g:, "kyotonight#none", ["NONE", "NONE"])
let g:kyotonight#cl          = get(g:, "kyotonight#cl", ["#292e42", "NONE"])
let g:kyotonight#hl          = get(g:, "kyotonight#hl", ["#33467c", "7"])
let g:kyotonight#black0      = get(g:, "kyotonight#black0", ["#0f0f14", "NONE"])
let g:kyotonight#bg          = get(g:, "kyotonight#bg", ["#1a1b26", "0"])
let g:kyotonight#black1      = get(g:, "kyotonight#black1", ["#24283b", "8"])
let g:kyotonight#grey0       = get(g:, "kyotonight#grey0", ["#414868", "7"])
let g:kyotonight#grey1       = get(g:, "kyotonight#grey1", ["#565f89", "15"])
let g:kyotonight#fg          = get(g:, "kyotonight#fg", ["#a9b1d6", "NONE"])
let g:kyotonight#cream       = get(g:, "kyotonight#cream", ["#cfc9c2", "15"])
let g:kyotonight#cyan1       = get(g:, "kyotonight#cyan1", ["#b4f9f8", "14"])
let g:kyotonight#teal        = get(g:, "kyotonight#teal", ["#73daca", "6"])
let g:kyotonight#blue1       = get(g:, "kyotonight#blue1", ["#7dcfff", "12"])
let g:kyotonight#blue0       = get(g:, "kyotonight#blue0", ["#7aa2f7", "4"])
let g:kyotonight#cyan0       = get(g:, "kyotonight#cyan0", ["#2ac3de", "6"])
let g:kyotonight#red         = get(g:, "kyotonight#red", ["#f7768e", "1"])
let g:kyotonight#orange      = get(g:, "kyotonight#orange", ["#ff9e64", "3"])
let g:kyotonight#yellow      = get(g:, "kyotonight#yellow", ["#e0af68", "11"])
let g:kyotonight#green       = get(g:, "kyotonight#green", ["#9ece6a", "2"])
let g:kyotonight#magenta     = get(g:, "kyotonight#magenta", ["#bb9af7", "5"])

let g:kyotonight_bold = get(g:, "kyotonight_bold", 1)
let s:bold = (g:kyotonight_bold == 0) ? "" : "bold,"

let g:kyotonight_underline = get(g:, "kyotonight_underline", 1)
let s:underline = (g:kyotonight_underline == 0) ? "NONE," : "underline,"

let g:kyotonight_italic = get(g:, "kyotonight_italic", (has("gui_running") || $TERM_ITALICS == "true"))
let s:italic = (g:kyotonight_italic == 0) ? "" : "italic,"

let g:kyotonight_italic_comments = get(g:, "kyotonight_italic_comments", 0)
let s:italicize_comments = (g:kyotonight_italic_comments == 0) ? "" : get(s:, "italic")

let g:kyotonight_uniform_status_lines = get(g:, "kyotonight_uniform_status_lines", 0)

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
call s:hi("ColorColumn", "", g:kyotonight#black1, "", "")
call s:hi("Cursor", g:kyotonight#bg, g:kyotonight#yellow, "", "")
call s:hi("CursorLine", "", g:kyotonight#cl, "NONE", "")
call s:hi("Error", g:kyotonight#bg, g:kyotonight#red, "", "")
call s:hi("iCursor", g:kyotonight#bg, g:kyotonight#yellow, "", "")
call s:hi("LineNr", g:kyotonight#grey0, "NONE", "", "")
call s:hi("MatchParen", g:kyotonight#blue1, g:kyotonight#grey0, "", "")
call s:hi("NonText", g:kyotonight#grey1, "", "", "")
call s:hi("Normal", g:kyotonight#fg, g:kyotonight#bg, "", "")
call s:hi("Pmenu", g:kyotonight#fg, g:kyotonight#black1, "NONE", "")
call s:hi("PmenuSbar", g:kyotonight#fg, g:kyotonight#black1, "", "")
call s:hi("PmenuSel", g:kyotonight#blue1, g:kyotonight#grey0, "", "")
call s:hi("PmenuThumb", g:kyotonight#blue1, g:kyotonight#grey0, "", "")
call s:hi("SpecialKey", g:kyotonight#grey0, "", "", "")
call s:hi("SpellBad", g:kyotonight#red, g:kyotonight#bg, "undercurl", g:kyotonight#red)
call s:hi("SpellCap", g:kyotonight#orange, g:kyotonight#bg, "undercurl", g:kyotonight#orange)
call s:hi("SpellLocal", g:kyotonight#yellow, g:kyotonight#bg, "undercurl", g:kyotonight#yellow)
call s:hi("SpellRare", g:kyotonight#cyan1, g:kyotonight#bg, "undercurl", g:kyotonight#cyan1)
call s:hi("Visual", "", g:kyotonight#hl, "", "")
call s:hi("VisualNOS", "", g:kyotonight#hl, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [g:kyotonight#bg[0], g:kyotonight#red[0], g:kyotonight#green[0], g:kyotonight#yellow[0], g:kyotonight#blue0[0], g:kyotonight#magenta[0], g:kyotonight#blue1[0], g:kyotonight#cream[0], g:kyotonight#grey0[0], g:kyotonight#red[0], g:kyotonight#green[0], g:kyotonight#yellow[0], g:kyotonight#blue0[0], g:kyotonight#magenta[0], g:kyotonight#teal[0], g:kyotonight#cyan1[0]]
endif

if has('nvim')
  "+- Neovim Terminal Colors -+
  let g:terminal_color_0 = g:kyotonight#bg[0]
  let g:terminal_color_1 = g:kyotonight#red[0]
  let g:terminal_color_2 = g:kyotonight#green[0]
  let g:terminal_color_3 = g:kyotonight#yellow[0]
  let g:terminal_color_4 = g:kyotonight#blue0[0]
  let g:terminal_color_5 = g:kyotonight#magenta[0]
  let g:terminal_color_6 = g:kyotonight#blue1[0]
  let g:terminal_color_7 = g:kyotonight#cream[0]
  let g:terminal_color_8 = g:kyotonight#grey0[0]
  let g:terminal_color_9 = g:kyotonight#red[0]
  let g:terminal_color_10 = g:kyotonight#green[0]
  let g:terminal_color_11 = g:kyotonight#yellow[0]
  let g:terminal_color_12 = g:kyotonight#blue0[0]
  let g:terminal_color_13 = g:kyotonight#magenta[0]
  let g:terminal_color_14 = g:kyotonight#teal[0]
  let g:terminal_color_15 = g:kyotonight#cyan1[0]

  "+- Neovim Support -+
  call s:hi("healthError", g:kyotonight#red, g:kyotonight#bg, "", "")
  call s:hi("healthSuccess", g:kyotonight#green, g:kyotonight#bg, "", "")
  call s:hi("healthWarning", g:kyotonight#yellow, g:kyotonight#bg, "", "")
  call s:hi("TermCursorNC", "", g:kyotonight#bg, "", "")

  "+- Neovim Diagnostics API -+
  call s:hi("DiagnosticWarn", g:kyotonight#yellow, "", "", "")
  call s:hi("DiagnosticError", g:kyotonight#red, "", "", "")
  call s:hi("DiagnosticInfo", g:kyotonight#blue1, "", "", "")
  call s:hi("DiagnosticHint", g:kyotonight#cyan1, "", "", "")
  call s:hi("DiagnosticSignWarn", g:kyotonight#yellow, "", "", "")
  call s:hi("DiagnosticSignError", g:kyotonight#red, "", "", "")
  call s:hi("DiagnosticSignInfo", g:kyotonight#blue1, "", "", "")
  call s:hi("DiagnosticSignHint", g:kyotonight#cyan1, "", "", "")
  call s:hi("DiagnosticUnderlineWarn", g:kyotonight#yellow, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineError", g:kyotonight#red, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineInfo", g:kyotonight#blue1, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineHint", g:kyotonight#cyan1, "", "undercurl", "")

  "+- Neovim DocumentHighlight -+
  call s:hi("LspReferenceText", "", g:kyotonight#grey0, "", "")
  call s:hi("LspReferenceRead", "", g:kyotonight#grey0, "", "")
  call s:hi("LspReferenceWrite", "", g:kyotonight#grey0, "", "")

  "+- Neovim LspSignatureHelp -+
  call s:hi("LspSignatureActiveParameter", g:kyotonight#blue0, "", s:underline, "")
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", g:kyotonight#bg, "", "")
if g:kyotonight_cursor_line_number_background == 0
  call s:hi("CursorLineNr", g:kyotonight#fg, "", "NONE", "")
else
  call s:hi("CursorLineNr", g:kyotonight#fg, g:kyotonight#black0, "NONE", "")
endif
call s:hi("Folded", g:kyotonight#grey0, g:kyotonight#bg, s:bold, "")
call s:hi("FoldColumn", g:kyotonight#grey0, g:kyotonight#bg, "", "")
call s:hi("SignColumn", g:kyotonight#bg, g:kyotonight#bg, "", "")

"+--- Navigation ---+
call s:hi("Directory", g:kyotonight#blue0, "", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", g:kyotonight#bg, "", "", "")
call s:hi("ErrorMsg", g:kyotonight#bg, g:kyotonight#red, "", "")
call s:hi("ModeMsg", g:kyotonight#fg, "", "", "")
call s:hi("MoreMsg", g:kyotonight#blue0, "", "", "")
call s:hi("Question", g:kyotonight#fg, "", "", "")
if g:kyotonight_uniform_status_lines == 0
  call s:hi("StatusLine", g:kyotonight#blue0, g:kyotonight#grey0, "NONE", "")
  call s:hi("StatusLineNC", g:kyotonight#fg, g:kyotonight#bg, "NONE", "")
  call s:hi("StatusLineTerm", g:kyotonight#blue0, g:kyotonight#grey0, "NONE", "")
  call s:hi("StatusLineTermNC", g:kyotonight#fg, g:kyotonight#bg, "NONE", "")
else
  call s:hi("StatusLine", g:kyotonight#blue0, g:kyotonight#grey0, "NONE", "")
  call s:hi("StatusLineNC", g:kyotonight#fg, g:kyotonight#grey0, "NONE", "")
  call s:hi("StatusLineTerm", g:kyotonight#blue0, g:kyotonight#grey0, "NONE", "")
  call s:hi("StatusLineTermNC", g:kyotonight#fg, g:kyotonight#grey0, "NONE", "")
endif
call s:hi("WarningMsg", g:kyotonight#bg, g:kyotonight#yellow, "", "")
call s:hi("WildMenu", g:kyotonight#blue0, g:kyotonight#bg, "", "")

"+--- Search ---+
call s:hi("IncSearch", g:kyotonight#cyan1, g:kyotonight#blue0, s:underline, "")
call s:hi("Search", g:kyotonight#black1, g:kyotonight#blue0, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", g:kyotonight#fg, g:kyotonight#bg, "NONE", "")
call s:hi("TabLineFill", g:kyotonight#grey0, g:kyotonight#bg, "NONE", "")
call s:hi("TabLineSel", g:kyotonight#grey1, g:kyotonight#bg, "NONE", "")

"+--- Window ---+
call s:hi("Title", g:kyotonight#fg, "", "NONE", "")
call s:hi("VertSplit", g:kyotonight#fg, "", "NONE", "")
hi! link WinSeparator VertSplit

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", g:kyotonight#orange, "", "", "")
call s:hi("Character", g:kyotonight#green, "", "", "")
call s:hi("Comment", g:kyotonight#grey1, "", s:italicize_comments, "")
call s:hi("Conceal", g:kyotonight#grey1, g:kyotonight#black1, s:italic, "")
call s:hi("Conditional", g:kyotonight#magenta, "", "", "")
call s:hi("Constant", g:kyotonight#cream, "", s:italic, "")
call s:hi("Decorator", g:kyotonight#orange, "", "", "")
call s:hi("Define", g:kyotonight#blue0, "", "", "")
call s:hi("Delimiter", g:kyotonight#blue0, "", "", "")
call s:hi("Exception", g:kyotonight#magenta, "", "", "") 
call s:hi("Float", g:kyotonight#orange, "", "", "")
call s:hi("Function", g:kyotonight#blue1, "", "", "")
call s:hi("Identifier", g:kyotonight#blue0, "", s:italic, "")
call s:hi("Variable", g:kyotonight#fg, "", "", "")
call s:hi("Include", g:kyotonight#blue1, "", "", "") 
call s:hi("Keyword", g:kyotonight#blue0, "", "", "")
call s:hi("Label", g:kyotonight#blue0, "", "", "")
call s:hi("Number", g:kyotonight#orange, "", "", "")
call s:hi("Operator", g:kyotonight#magenta, "", "NONE", "")
call s:hi("PreProc", g:kyotonight#blue0, "", "NONE", "")
call s:hi("Repeat", g:kyotonight#magenta, "", "", "")
call s:hi("Special", g:kyotonight#blue0, "", "", "")
call s:hi("SpecialChar", g:kyotonight#yellow, "", "", "")
call s:hi("SpecialComment", g:kyotonight#blue1, "", s:italicize_comments, "")
call s:hi("Statement", g:kyotonight#blue0, "", "", "")
call s:hi("StorageClass", g:kyotonight#blue0, "", "", "")
call s:hi("String", g:kyotonight#green, "", "", "")
call s:hi("Structure", g:kyotonight#magenta, "", "", "") 
call s:hi("Tag", g:kyotonight#fg, "", "", "")
call s:hi("Todo", g:kyotonight#yellow, "NONE", "", "")
call s:hi("Type", g:kyotonight#teal, "", "NONE", "")
call s:hi("Typedef", g:kyotonight#teal, "", "", "")
hi! link Annotation Decorator
hi! link Macro Define
hi! link PreCondit PreProc
hi! link Ignore Comment

"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", g:kyotonight#cyan0, "", "", "")
call s:hi("asciidocAttributeList", g:kyotonight#cyan0, "", "", "")
call s:hi("asciidocAttributeRef", g:kyotonight#cyan0, "", "", "")
call s:hi("asciidocHLabel", g:kyotonight#blue0, "", "", "")
call s:hi("asciidocListingBlock", g:kyotonight#teal, "", "", "")
call s:hi("asciidocMacroAttributes", g:kyotonight#blue1, "", "", "")
call s:hi("asciidocOneLineTitle", g:kyotonight#blue1, "", "", "")
call s:hi("asciidocPassthroughBlock", g:kyotonight#blue0, "", "", "")
call s:hi("asciidocQuotedMonospaced", g:kyotonight#teal, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", g:kyotonight#teal, "", "", "")
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

call s:hi("awkCharClass", g:kyotonight#teal, "", "", "")
call s:hi("awkPatterns", g:kyotonight#blue0, "", s:bold, "")
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

call s:hi("cIncluded", g:kyotonight#teal, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit
hi! link cConstant Type

call s:hi("cmakeGeneratorExpression", g:kyotonight#cyan0, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", g:kyotonight#teal, "", "", "")
call s:hi("cssDefinition", g:kyotonight#teal, "", "NONE", "")
call s:hi("cssIdentifier", g:kyotonight#teal, "", s:underline, "")
call s:hi("cssStringQ", g:kyotonight#teal, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", g:kyotonight#blue1, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", g:kyotonight#teal, "", "", "")
call s:hi("dtExecKey", g:kyotonight#teal, "", "", "")
call s:hi("dtLocaleKey", g:kyotonight#teal, "", "", "")
call s:hi("dtNumericKey", g:kyotonight#teal, "", "", "")
call s:hi("dtTypeKey", g:kyotonight#teal, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:kyotonight_uniform_diff_background == 0
  call s:hi("DiffAdd", g:kyotonight#green, g:kyotonight#black0, "inverse", "")
  call s:hi("DiffChange", g:kyotonight#orange, g:kyotonight#black0, "inverse", "")
  call s:hi("DiffDelete", g:kyotonight#red, g:kyotonight#black0, "inverse", "")
  call s:hi("DiffText", g:kyotonight#blue0, g:kyotonight#black0, "inverse", "")
else
  call s:hi("DiffAdd", g:kyotonight#green, g:kyotonight#bg, "", "")
  call s:hi("DiffChange", g:kyotonight#orange, g:kyotonight#bg, "", "")
  call s:hi("DiffDelete", g:kyotonight#red, g:kyotonight#bg, "", "")
  call s:hi("DiffText", g:kyotonight#blue0, g:kyotonight#bg, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", g:kyotonight#teal, "", "", "")

call s:hi("goBuiltins", g:kyotonight#teal, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", g:kyotonight#grey0, "", "", "")
call s:hi("helpHyperTextJump", g:kyotonight#blue1, "", s:underline, "")

call s:hi("htmlArg", g:kyotonight#teal, "", "", "")
call s:hi("htmlLink", g:kyotonight#fg, "", "NONE", "NONE")
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

call s:hi("javaDocTags", g:kyotonight#teal, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", g:kyotonight#teal, "", "", "")

call s:hi("lessClass", g:kyotonight#teal, "", "", "")
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

call s:hi("markdownBlockquote", g:kyotonight#teal, "", "", "")
call s:hi("markdownCode", g:kyotonight#teal, "", "", "")
call s:hi("markdownCodeDelimiter", g:kyotonight#teal, "", "", "")
call s:hi("markdownFootnote", g:kyotonight#teal, "", "", "")
call s:hi("markdownId", g:kyotonight#teal, "", "", "")
call s:hi("markdownIdDeclaration", g:kyotonight#teal, "", "", "")
call s:hi("markdownH1", g:kyotonight#blue1, "", "", "")
call s:hi("markdownLinkText", g:kyotonight#blue1, "", "", "")
call s:hi("markdownUrl", g:kyotonight#fg, "", "NONE", "")
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

call s:hi("perlPackageDecl", g:kyotonight#teal, "", "", "")

call s:hi("phpClasses", g:kyotonight#teal, "", "", "")
call s:hi("phpDocTags", g:kyotonight#teal, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", g:kyotonight#teal, "", "", "")
call s:hi("podVerbatimLine", g:kyotonight#fg, "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", g:kyotonight#teal, "", "", "")
call s:hi("rubySymbol", g:kyotonight#cyan1, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", g:kyotonight#cyan0, "", "", "")
call s:hi("rustEnum", g:kyotonight#teal, "", s:bold, "")
call s:hi("rustMacro", g:kyotonight#blue1, "", s:bold, "")
call s:hi("rustModPath", g:kyotonight#teal, "", "", "")
call s:hi("rustPanic", g:kyotonight#blue0, "", s:bold, "")
call s:hi("rustTrait", g:kyotonight#teal, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", g:kyotonight#teal, "", "", "")
call s:hi("sassId", g:kyotonight#teal, "", s:underline, "")
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

call s:hi("vimAugroup", g:kyotonight#teal, "", "", "")
call s:hi("vimMapRhs", g:kyotonight#teal, "", "", "")
call s:hi("vimNotation", g:kyotonight#teal, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", g:kyotonight#teal, "", "", "")
call s:hi("xmlCdataStart", g:kyotonight#grey1, "", s:bold, "")
call s:hi("xmlNamespace", g:kyotonight#teal, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", g:kyotonight#teal, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", g:kyotonight#yellow, "", "", "")
call s:hi("ALEErrorSign", g:kyotonight#red, "", "", "")
call s:hi("ALEWarning", g:kyotonight#yellow, "", "undercurl", "")
call s:hi("ALEError", g:kyotonight#red, "", "undercurl", "")

" Coc
" > neoclide/coc.nvim
call s:hi("CocWarningHighlight", g:kyotonight#yellow, "", "undercurl", "")
call s:hi("CocErrorHighlight", g:kyotonight#red, "", "undercurl", "")
call s:hi("CocInfoHighlight", g:kyotonight#blue1, "", "undercurl", "")
call s:hi("CocHintHighlight", g:kyotonight#cyan1, "", "undercurl", "")
call s:hi("CocWarningSign", g:kyotonight#yellow, "", "", "")
call s:hi("CocErrorSign", g:kyotonight#red, "", "", "")
call s:hi("CocInfoSign", g:kyotonight#blue1, "", "", "")
call s:hi("CocHintSign", g:kyotonight#cyan1, "", "", "")
call s:hi("CocSearch", g:kyotonight#blue1, "", "", "")
call s:hi("CocNotificationProgress", g:kyotonight#blue1, "", "", "")

if has('nvim')
  " Neovim LSP
  " > neovim/nvim-lspconfig
  call s:hi("LspCodeLens", g:kyotonight#grey1, "", "", "")
  if has("nvim-0.5")
    call s:hi("LspDiagnosticsDefaultWarning", g:kyotonight#yellow, "", "", "")
    call s:hi("LspDiagnosticsDefaultError", g:kyotonight#red, "", "", "")
    call s:hi("LspDiagnosticsDefaultInformation", g:kyotonight#blue1, "", "", "")
    call s:hi("LspDiagnosticsDefaultHint", g:kyotonight#cyan1, "", "", "")
    call s:hi("LspDiagnosticsUnderlineWarning", g:kyotonight#yellow, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineError", g:kyotonight#red, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineInformation", g:kyotonight#blue1, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineHint", g:kyotonight#cyan1, "", "undercurl", "")
  endif
  
  " Gitsigns
  " > lewis6991/gitsigns.nvim
  hi! link GitSignsCurrentLineBlame Comment
endif

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", g:kyotonight#green, "", "", "")
call s:hi("GitGutterChange", g:kyotonight#yellow, "", "", "")
call s:hi("GitGutterChangeDelete", g:kyotonight#red, "", "", "")
call s:hi("GitGutterDelete", g:kyotonight#red, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", g:kyotonight#green, "", "", "")
call s:hi("SignifySignChange", g:kyotonight#yellow, "", "", "")
call s:hi("SignifySignChangeDelete", g:kyotonight#red, "", "", "")
call s:hi("SignifySignDelete", g:kyotonight#red, "", "", "")

" Sneak
" > justinmk/vim-sneak
hi! link Sneak Search

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", g:kyotonight#red, "", "", "")
call s:hi("gitcommitUntrackedFile", g:kyotonight#red, "", "", "")
call s:hi("gitcommitSelectedFile", g:kyotonight#green, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", g:kyotonight#fg, g:kyotonight#grey0, "", "")
call s:hi("jediFat", g:kyotonight#blue1, g:kyotonight#grey0, s:underline.s:bold, "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", g:kyotonight#teal, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-clap
" > liuchengxu/vim-clap
call s:hi("ClapDir", g:kyotonight#fg, "", "", "")
call s:hi("ClapDisplay", g:kyotonight#fg, g:kyotonight#bg, "", "")
call s:hi("ClapFile", g:kyotonight#fg, "", "", "")
call s:hi("ClapMatches", g:kyotonight#blue1, "", "", "")
call s:hi("ClapNoMatchesFound", g:kyotonight#yellow, "", "", "")
call s:hi("ClapSelected", g:kyotonight#teal, "", s:bold, "")
call s:hi("ClapSelectedSign", g:kyotonight#blue0, "", "", "")
let s:clap_matches = [
        \ [g:kyotonight#blue1[0], g:kyotonight#blue1[1]] ,
        \ [g:kyotonight#blue0[0], g:kyotonight#blue0[1]] ,
        \ [g:kyotonight#cyan0[0], g:kyotonight#cyan0[1]] ,
        \ ]
for s:clap_match_i in range(1,12)
  let clap_match_color = s:clap_matches[s:clap_match_i % len(s:clap_matches) - 1]
  call s:hi("ClapMatches" . s:clap_match_i, [clap_match_color[0], clap_match_color[1]], ["", ""], "", "")
  call s:hi("ClapFuzzyMatches" . s:clap_match_i, [clap_match_color[0], clap_match_color[1]], ["", ""], "", "")
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
call s:hi("IndentGuidesEven", "", g:kyotonight#bg, "", "")
call s:hi("IndentGuidesOdd", "", g:kyotonight#black1, "", "")

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", g:kyotonight#red, "", "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", g:kyotonight#blue1, "", "", "")

" vim-startify
" > mhinz/vim-startify
call s:hi("StartifyFile", g:kyotonight#cyan1, "", "", "")
call s:hi("StartifyFooter", g:kyotonight#yellow, "", s:italic, "")
call s:hi("StartifyHeader", g:kyotonight#blue0, "", "", "")
call s:hi("StartifyNumber", g:kyotonight#magenta, "", "", "")
call s:hi("StartifyPath", g:kyotonight#blue0, "", "", "")
hi! link StartifyBracket Delimiter
hi! link StartifySlash Normal
hi! link StartifySpecial Comment

" dashboard-nvim
" > glepnir/dashboard-nvim
call s:hi("DashboardHeader", g:kyotonight#blue0, "", "", "")
call s:hi("DashboardCenter", g:kyotonight#magenta, "", "", "")
call s:hi("DashboardFooter", g:kyotonight#yellow, "", s:italic, "")
call s:hi("DashboardShortCut", g:kyotonight#teal, "", "", "")

" nvim-tree.lua
" > nvim-tree/nvim-tree.lua
call s:hi("NvimTreeNormal", g:kyotonight#fg, g:kyotonight#black0, "", "")
call s:hi("NvimTreeWinSeparator", g:kyotonight#black0, g:kyotonight#black0, "", "")
call s:hi("NvimTreeNormalNC", g:kyotonight#fg, g:kyotonight#black0, "", "")
call s:hi("NvimTreeRootFolder", g:kyotonight#magenta, g:kyotonight#black0, s:bold, "")

" barbar.nvim
" > romgrk/barbar.nvim
call s:hi("BufferCurrentMod", g:kyotonight#yellow, g:kyotonight#bg, "", "")
call s:hi("BufferVisibleMod", g:kyotonight#yellow, g:kyotonight#grey0, "", "")
call s:hi("BufferInactiveMod", g:kyotonight#yellow, g:kyotonight#black0, "", "")

" nnn.nvim
" > luukvbaal/nnn.nvim
call s:hi("NnnNormal", g:kyotonight#fg, g:kyotonight#bg, "", "")
call s:hi("NnnNormalNC", g:kyotonight#fg, g:kyotonight#bg, "", "")

" vim-cursorword
" > itchyny/vim-cursorword
call s:hi("CursorWord", "", g:kyotonight#black0, "", "")

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi("haskellPreProc", g:kyotonight#cyan0, "", "", "")
call s:hi("haskellType", g:kyotonight#teal, "", "", "")
hi! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", g:kyotonight#blue1, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Pandoc
" > vim-pandoc/vim-pandoc-syntax
call s:hi("pandocDefinitionBlockTerm", g:kyotonight#teal, "", s:italic, "")
call s:hi("pandocTableDelims", g:kyotonight#grey0, "", "", "")
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
call s:hi("typescriptBOMWindowMethod", g:kyotonight#blue1, "", s:italic, "")
call s:hi("typescriptClassName", g:kyotonight#teal, "", "", "")
call s:hi("typescriptDecorator", g:kyotonight#orange, "", "", "")
call s:hi("typescriptInterfaceName", g:kyotonight#teal, "", s:bold, "")
call s:hi("typescriptRegexpString", g:kyotonight#yellow, "", "", "")
" TypeScript JSX
call s:hi("tsxAttrib", g:kyotonight#teal, "", "", "")
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
call s:hi("mkdCode", g:kyotonight#teal, "", "", "")
call s:hi("mkdFootnote", g:kyotonight#blue1, "", "", "")
call s:hi("mkdRule", g:kyotonight#cyan0, "", "", "")
call s:hi("mkdLineBreak", g:kyotonight#blue0, "", "", "")
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
call s:hi("phpClass", g:kyotonight#teal, "", "", "")
call s:hi("phpClassImplements", g:kyotonight#teal, "", s:bold, "")
hi! link phpClassExtends phpClass
hi! link phpFunction Function
hi! link phpMethod Function
hi! link phpUseClass phpClass

" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, g:kyotonight#blue1, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolorfg = [g:kyotonight#teal[0], g:kyotonight#blue1[0], g:kyotonight#blue0[0], g:kyotonight#cyan0[0], g:kyotonight#green[0], g:kyotonight#magenta[0]]
  let s:vimwiki_hcolor_ctermfg = [g:kyotonight#teal[1], g:kyotonight#blue1[1], g:kyotonight#blue0[1], g:kyotonight#cyan0[1], g:kyotonight#green[1], g:kyotonight#magenta[1]]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, [s:vimwiki_hcolorfg[s:i-1] , ""], [s:vimwiki_hcolor_ctermfg[s:i-1], ""], s:bold, "")
  endfor
endif
call s:hi("VimwikiLink", g:kyotonight#blue1, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", g:kyotonight#teal, "", "", "")

" Public API
function! KyotoNightPalette() abort
    let ret = {}
    let colors = [ "none",
                \ "cl",
                \ "hl",
                \ "black0",
                \ "bg",
                \ "black1",
                \ "grey0",
                \ "grey1",
                \ "fg",
                \ "cream",
                \ "cyan1",
                \ "teal",
                \ "blue1",
                \ "blue0",
                \ "cyan0",
                \ "red",
                \ "orange",
                \ "yellow",
                \ "green",
                \ "magenta",
                \ ]
    for color in colors
        execute 'let ret["'.color.'"] = g:kyotonight#'.color
    endfor
    return ret
endfunction
