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
let s:kyotonight_vim_version="0.0.1"
set background=dark

let s:kyotonight0_gui = "#0f0f14"
let s:kyotonight1_gui = "#1a1b26"
let s:kyotonight2_gui = "#24283b"
let s:kyotonight3_gui = "#414868"
let s:kyotonight3_gui_bright = "#565f89"
let s:kyotonight4_gui = "#a9b1d6"
let s:kyotonight5_gui = "#cfc9c2"
let s:kyotonight6_gui = "#b4f9f8"
let s:kyotonight7_gui = "#73daca"
let s:kyotonight8_gui = "#7dcfff"
let s:kyotonight9_gui = "#7aa2f7"
let s:kyotonight10_gui = "#2ac3de"
let s:kyotonight11_gui = "#f7768e"
let s:kyotonight12_gui = "#ff9e64"
let s:kyotonight13_gui = "#e0af68"
let s:kyotonight14_gui = "#9ece6a"
let s:kyotonight15_gui = "#bb9af7"

let s:kyotonight1_term = "0"
let s:kyotonight3_term = "8"
let s:kyotonight5_term = "7"
let s:kyotonight6_term = "15"
let s:kyotonight7_term = "14"
let s:kyotonight8_term = "6"
let s:kyotonight9_term = "4"
let s:kyotonight10_term = "12"
let s:kyotonight11_term = "1"
let s:kyotonight12_term = "11"
let s:kyotonight13_term = "3"
let s:kyotonight14_term = "2"
let s:kyotonight15_term = "5"

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

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  let cmd = ""
  if a:guifg != ""
    let cmd = cmd . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    let cmd = cmd . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    let cmd = cmd . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    let cmd = cmd . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    let cmd = cmd . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    let cmd = cmd . " guisp=" . a:guisp
  endif
  if cmd != ""
    exec "hi " . a:group . cmd
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", s:bold, "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:kyotonight2_gui, "NONE", s:kyotonight1_term, "", "")
call s:hi("Cursor", s:kyotonight1_gui, s:kyotonight4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:kyotonight0_gui, "NONE", s:kyotonight1_term, "NONE", "")
call s:hi("Error", s:kyotonight4_gui, s:kyotonight11_gui, "", s:kyotonight11_term, "", "")
call s:hi("iCursor", s:kyotonight0_gui, s:kyotonight4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:kyotonight3_gui, "NONE", s:kyotonight3_term, "NONE", "", "")
call s:hi("MatchParen", s:kyotonight8_gui, s:kyotonight3_gui, s:kyotonight8_term, s:kyotonight3_term, "", "")
call s:hi("NonText", s:kyotonight2_gui, "", s:kyotonight3_term, "", "", "")
call s:hi("Normal", s:kyotonight4_gui, s:kyotonight1_gui, "NONE", "NONE", "", "")
call s:hi("Pmenu", s:kyotonight4_gui, s:kyotonight2_gui, "NONE", s:kyotonight1_term, "NONE", "")
call s:hi("PmenuSbar", s:kyotonight4_gui, s:kyotonight2_gui, "NONE", s:kyotonight1_term, "", "")
call s:hi("PmenuSel", s:kyotonight8_gui, s:kyotonight3_gui, s:kyotonight8_term, s:kyotonight3_term, "", "")
call s:hi("PmenuThumb", s:kyotonight8_gui, s:kyotonight3_gui, "NONE", s:kyotonight3_term, "", "")
call s:hi("SpecialKey", s:kyotonight3_gui, "", s:kyotonight3_term, "", "", "")
call s:hi("SpellBad", s:kyotonight11_gui, s:kyotonight1_gui, s:kyotonight11_term, "NONE", "undercurl", s:kyotonight11_gui)
call s:hi("SpellCap", s:kyotonight13_gui, s:kyotonight1_gui, s:kyotonight13_term, "NONE", "undercurl", s:kyotonight13_gui)
call s:hi("SpellLocal", s:kyotonight5_gui, s:kyotonight1_gui, s:kyotonight5_term, "NONE", "undercurl", s:kyotonight5_gui)
call s:hi("SpellRare", s:kyotonight6_gui, s:kyotonight1_gui, s:kyotonight6_term, "NONE", "undercurl", s:kyotonight6_gui)
call s:hi("Visual", "", s:kyotonight3_gui, "", s:kyotonight1_term, "", "")
call s:hi("VisualNOS", "", s:kyotonight3_gui, "", s:kyotonight1_term, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [s:kyotonight1_gui, s:kyotonight11_gui, s:kyotonight14_gui, s:kyotonight13_gui, s:kyotonight9_gui, s:kyotonight15_gui, s:kyotonight8_gui, s:kyotonight5_gui, s:kyotonight3_gui, s:kyotonight11_gui, s:kyotonight14_gui, s:kyotonight13_gui, s:kyotonight9_gui, s:kyotonight15_gui, s:kyotonight7_gui, s:kyotonight6_gui]
endif

if has('nvim')
  "+- Neovim Terminal Colors -+
  let g:terminal_color_0 = s:kyotonight1_gui
  let g:terminal_color_1 = s:kyotonight11_gui
  let g:terminal_color_2 = s:kyotonight14_gui
  let g:terminal_color_3 = s:kyotonight13_gui
  let g:terminal_color_4 = s:kyotonight9_gui
  let g:terminal_color_5 = s:kyotonight15_gui
  let g:terminal_color_6 = s:kyotonight8_gui
  let g:terminal_color_7 = s:kyotonight5_gui
  let g:terminal_color_8 = s:kyotonight3_gui
  let g:terminal_color_9 = s:kyotonight11_gui
  let g:terminal_color_10 = s:kyotonight14_gui
  let g:terminal_color_11 = s:kyotonight13_gui
  let g:terminal_color_12 = s:kyotonight9_gui
  let g:terminal_color_13 = s:kyotonight15_gui
  let g:terminal_color_14 = s:kyotonight7_gui
  let g:terminal_color_15 = s:kyotonight6_gui

  "+- Neovim Support -+
  call s:hi("healthError", s:kyotonight11_gui, s:kyotonight1_gui, s:kyotonight11_term, s:kyotonight1_term, "", "")
  call s:hi("healthSuccess", s:kyotonight14_gui, s:kyotonight1_gui, s:kyotonight14_term, s:kyotonight1_term, "", "")
  call s:hi("healthWarning", s:kyotonight13_gui, s:kyotonight1_gui, s:kyotonight13_term, s:kyotonight1_term, "", "")
  call s:hi("TermCursorNC", "", s:kyotonight1_gui, "", s:kyotonight1_term, "", "")

  "+- Neovim Diagnostics API -+
  call s:hi("DiagnosticWarn", s:kyotonight13_gui, "", s:kyotonight13_term, "", "", "")
  call s:hi("DiagnosticError" , s:kyotonight11_gui, "", s:kyotonight11_term, "", "", "")
  call s:hi("DiagnosticInfo" , s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
  call s:hi("DiagnosticHint" , s:kyotonight10_gui, "", s:kyotonight10_term, "", "", "")
  call s:hi("DiagnosticUnderlineWarn" , s:kyotonight13_gui, "", s:kyotonight13_term, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineError" , s:kyotonight11_gui, "", s:kyotonight11_term, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineInfo" , s:kyotonight8_gui, "", s:kyotonight8_term, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineHint" , s:kyotonight10_gui, "", s:kyotonight10_term, "", "undercurl", "")

  "+- Neovim DocumentHighlight -+
  call s:hi("LspReferenceText", "", s:kyotonight3_gui, "", s:kyotonight3_term, "", "")
  call s:hi("LspReferenceRead", "", s:kyotonight3_gui, "", s:kyotonight3_term, "", "")
  call s:hi("LspReferenceWrite", "", s:kyotonight3_gui, "", s:kyotonight3_term, "", "")

  "+- Neovim LspSignatureHelp -+
  call s:hi("LspSignatureActiveParameter", s:kyotonight8_gui, "", s:kyotonight8_term, "", s:underline, "")
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:kyotonight1_gui, "NONE", s:kyotonight1_term, "", "")
if g:kyotonight_cursor_line_number_background == 0
  call s:hi("CursorLineNr", s:kyotonight4_gui, "", "NONE", "", "NONE", "")
else
  call s:hi("CursorLineNr", s:kyotonight4_gui, s:kyotonight0_gui, "NONE", s:kyotonight1_term, "NONE", "")
endif
call s:hi("Folded", s:kyotonight3_gui, s:kyotonight1_gui, s:kyotonight3_term, s:kyotonight1_term, s:bold, "")
call s:hi("FoldColumn", s:kyotonight3_gui, s:kyotonight1_gui, s:kyotonight3_term, "NONE", "", "")
call s:hi("SignColumn", s:kyotonight1_gui, s:kyotonight1_gui, s:kyotonight1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:kyotonight8_gui, "", s:kyotonight8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:kyotonight1_gui, "", s:kyotonight1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:kyotonight4_gui, s:kyotonight11_gui, "NONE", s:kyotonight11_term, "", "")
call s:hi("ModeMsg", s:kyotonight4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
call s:hi("Question", s:kyotonight4_gui, "", "NONE", "", "", "")
if g:kyotonight_uniform_status_lines == 0
  call s:hi("StatusLine", s:kyotonight8_gui, s:kyotonight3_gui, s:kyotonight8_term, s:kyotonight3_term, "NONE", "")
  call s:hi("StatusLineNC", s:kyotonight4_gui, s:kyotonight1_gui, "NONE", s:kyotonight1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:kyotonight8_gui, s:kyotonight3_gui, s:kyotonight8_term, s:kyotonight3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:kyotonight4_gui, s:kyotonight1_gui, "NONE", s:kyotonight1_term, "NONE", "")
else
  call s:hi("StatusLine", s:kyotonight8_gui, s:kyotonight3_gui, s:kyotonight8_term, s:kyotonight3_term, "NONE", "")
  call s:hi("StatusLineNC", s:kyotonight4_gui, s:kyotonight3_gui, "NONE", s:kyotonight3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:kyotonight8_gui, s:kyotonight3_gui, s:kyotonight8_term, s:kyotonight3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:kyotonight4_gui, s:kyotonight3_gui, "NONE", s:kyotonight3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:kyotonight1_gui, s:kyotonight13_gui, s:kyotonight1_term, s:kyotonight13_term, "", "")
call s:hi("WildMenu", s:kyotonight8_gui, s:kyotonight1_gui, s:kyotonight8_term, s:kyotonight1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:kyotonight6_gui, s:kyotonight10_gui, s:kyotonight6_term, s:kyotonight10_term, s:underline, "")
call s:hi("Search", s:kyotonight1_gui, s:kyotonight8_gui, s:kyotonight1_term, s:kyotonight8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:kyotonight4_gui, s:kyotonight1_gui, "NONE", s:kyotonight1_term, "NONE", "")
call s:hi("TabLineFill", s:kyotonight3_gui, s:kyotonight0_gui, "NONE", s:kyotonight1_term, "NONE", "")
call s:hi("TabLineSel", s:kyotonight8_gui, s:kyotonight3_gui, s:kyotonight8_term, s:kyotonight3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:kyotonight4_gui, "", "NONE", "", "NONE", "")

if g:kyotonight_bold_vertical_split_line == 0
  call s:hi("VertSplit", s:kyotonight3_gui, s:kyotonight1_gui, s:kyotonight3_term, "NONE", "NONE", "")
else
  call s:hi("VertSplit", s:kyotonight0_gui, s:kyotonight0_gui, s:kyotonight3_term, s:kyotonight3_term, "NONE", "")
endif

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
call s:hi("Character", s:kyotonight14_gui, "", s:kyotonight14_term, "", "", "")
call s:hi("Comment", s:kyotonight3_gui_bright, "", s:kyotonight3_term, "", s:italicize_comments, "")
call s:hi("Conceal", "", "NONE", "", "NONE", "", "")
call s:hi("Conditional", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
call s:hi("Constant", s:kyotonight4_gui, "", "NONE", "", "", "")
call s:hi("Decorator", s:kyotonight12_gui, "", s:kyotonight12_term, "", "", "")
call s:hi("Define", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
call s:hi("Delimiter", s:kyotonight6_gui, "", s:kyotonight6_term, "", "", "")
call s:hi("Exception", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
call s:hi("Float", s:kyotonight15_gui, "", s:kyotonight15_term, "", "", "")
call s:hi("Function", s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
call s:hi("Identifier", s:kyotonight4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
call s:hi("Keyword", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
call s:hi("Label", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
call s:hi("Number", s:kyotonight15_gui, "", s:kyotonight15_term, "", "", "")
call s:hi("Operator", s:kyotonight9_gui, "", s:kyotonight9_term, "", "NONE", "")
call s:hi("PreProc", s:kyotonight9_gui, "", s:kyotonight9_term, "", "NONE", "")
call s:hi("Repeat", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
call s:hi("Special", s:kyotonight4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:kyotonight13_gui, "", s:kyotonight13_term, "", "", "")
call s:hi("SpecialComment", s:kyotonight8_gui, "", s:kyotonight8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
call s:hi("StorageClass", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
call s:hi("String", s:kyotonight14_gui, "", s:kyotonight14_term, "", "", "")
call s:hi("Structure", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
call s:hi("Tag", s:kyotonight4_gui, "", "", "", "", "")
call s:hi("Todo", s:kyotonight13_gui, "NONE", s:kyotonight13_term, "NONE", "", "")
call s:hi("Type", s:kyotonight9_gui, "", s:kyotonight9_term, "", "NONE", "")
call s:hi("Typedef", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
hi! link Annotation Decorator
hi! link Macro Define
hi! link PreCondit PreProc
hi! link Variable Identifier

"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:kyotonight10_gui, "", s:kyotonight10_term, "", "", "")
call s:hi("asciidocAttributeList", s:kyotonight10_gui, "", s:kyotonight10_term, "", "", "")
call s:hi("asciidocAttributeRef", s:kyotonight10_gui, "", s:kyotonight10_term, "", "", "")
call s:hi("asciidocHLabel", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
call s:hi("asciidocListingBlock", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("asciidocMacroAttributes", s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
call s:hi("asciidocOneLineTitle", s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
call s:hi("asciidocPassthroughBlock", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
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

call s:hi("awkCharClass", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("awkPatterns", s:kyotonight9_gui, "", s:kyotonight9_term, "", s:bold, "")
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

call s:hi("cIncluded", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit
hi! link cConstant Type

call s:hi("cmakeGeneratorExpression", s:kyotonight10_gui, "", s:kyotonight10_term, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("cssDefinition", s:kyotonight7_gui, "", s:kyotonight7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:kyotonight7_gui, "", s:kyotonight7_term, "", s:underline, "")
call s:hi("cssStringQ", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("dtExecKey", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("dtLocaleKey", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("dtNumericKey", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("dtTypeKey", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:kyotonight_uniform_diff_background == 0
  call s:hi("DiffAdd", s:kyotonight14_gui, s:kyotonight0_gui, s:kyotonight14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:kyotonight13_gui, s:kyotonight0_gui, s:kyotonight13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:kyotonight11_gui, s:kyotonight0_gui, s:kyotonight11_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:kyotonight9_gui, s:kyotonight0_gui, s:kyotonight9_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:kyotonight14_gui, s:kyotonight1_gui, s:kyotonight14_term, s:kyotonight1_term, "", "")
  call s:hi("DiffChange", s:kyotonight13_gui, s:kyotonight1_gui, s:kyotonight13_term, s:kyotonight1_term, "", "")
  call s:hi("DiffDelete", s:kyotonight11_gui, s:kyotonight1_gui, s:kyotonight11_term, s:kyotonight1_term, "", "")
  call s:hi("DiffText", s:kyotonight9_gui, s:kyotonight1_gui, s:kyotonight9_term, s:kyotonight1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")

call s:hi("goBuiltins", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:kyotonight3_gui, "", s:kyotonight3_term, "", "", "")
call s:hi("helpHyperTextJump", s:kyotonight8_gui, "", s:kyotonight8_term, "", s:underline, "")

call s:hi("htmlArg", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("htmlLink", s:kyotonight4_gui, "", "", "", "NONE", "NONE")
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

call s:hi("javaDocTags", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")

call s:hi("lessClass", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
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

call s:hi("markdownBlockquote", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("markdownCode", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("markdownFootnote", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("markdownId", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("markdownH1", s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
call s:hi("markdownLinkText", s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
call s:hi("markdownUrl", s:kyotonight4_gui, "", "NONE", "", "NONE", "")
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

call s:hi("perlPackageDecl", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")

call s:hi("phpClasses", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("phpDocTags", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("podVerbatimLine", s:kyotonight4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("rubySymbol", s:kyotonight6_gui, "", s:kyotonight6_term, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", s:kyotonight10_gui, "", s:kyotonight10_term, "", "", "")
call s:hi("rustEnum", s:kyotonight7_gui, "", s:kyotonight7_term, "", s:bold, "")
call s:hi("rustMacro", s:kyotonight8_gui, "", s:kyotonight8_term, "", s:bold, "")
call s:hi("rustModPath", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("rustPanic", s:kyotonight9_gui, "", s:kyotonight9_term, "", s:bold, "")
call s:hi("rustTrait", s:kyotonight7_gui, "", s:kyotonight7_term, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("sassId", s:kyotonight7_gui, "", s:kyotonight7_term, "", s:underline, "")
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

call s:hi("vimAugroup", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("vimMapRhs", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("vimNotation", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("xmlCdataStart", s:kyotonight3_gui_bright, "", s:kyotonight3_term, "", s:bold, "")
call s:hi("xmlNamespace", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:kyotonight13_gui, "", s:kyotonight13_term, "", "", "")
call s:hi("ALEErrorSign" , s:kyotonight11_gui, "", s:kyotonight11_term, "", "", "")
call s:hi("ALEWarning" , s:kyotonight13_gui, "", s:kyotonight13_term, "", "undercurl", "")
call s:hi("ALEError" , s:kyotonight11_gui, "", s:kyotonight11_term, "", "undercurl", "")

" Coc
" > neoclide/coc.vim
call s:hi("CocWarningHighlight" , s:kyotonight13_gui, "", s:kyotonight13_term, "", "undercurl", "")
call s:hi("CocErrorHighlight" , s:kyotonight11_gui, "", s:kyotonight11_term, "", "undercurl", "")
call s:hi("CocWarningSign", s:kyotonight13_gui, "", s:kyotonight13_term, "", "", "")
call s:hi("CocErrorSign" , s:kyotonight11_gui, "", s:kyotonight11_term, "", "", "")
call s:hi("CocInfoSign" , s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
call s:hi("CocHintSign" , s:kyotonight10_gui, "", s:kyotonight10_term, "", "", "")

if has('nvim')
  " Neovim LSP
  " > neovim/nvim-lspconfig
  call s:hi("LspCodeLens", s:kyotonight3_gui_bright, "", s:kyotonight3_term, "", "", "")
  if has("nvim-0.5")
    call s:hi("LspDiagnosticsDefaultWarning", s:kyotonight13_gui, "", s:kyotonight13_term, "", "", "")
    call s:hi("LspDiagnosticsDefaultError" , s:kyotonight11_gui, "", s:kyotonight11_term, "", "", "")
    call s:hi("LspDiagnosticsDefaultInformation" , s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
    call s:hi("LspDiagnosticsDefaultHint" , s:kyotonight10_gui, "", s:kyotonight10_term, "", "", "")
    call s:hi("LspDiagnosticsUnderlineWarning" , s:kyotonight13_gui, "", s:kyotonight13_term, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineError" , s:kyotonight11_gui, "", s:kyotonight11_term, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineInformation" , s:kyotonight8_gui, "", s:kyotonight8_term, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineHint" , s:kyotonight10_gui, "", s:kyotonight10_term, "", "undercurl", "")
  endif
  
  " Gitsigns
  " > lewis6991/gitsigns.nvim
  hi! link GitSignsCurrentLineBlame Comment
endif

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:kyotonight14_gui, "", s:kyotonight14_term, "", "", "")
call s:hi("GitGutterChange", s:kyotonight13_gui, "", s:kyotonight13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:kyotonight11_gui, "", s:kyotonight11_term, "", "", "")
call s:hi("GitGutterDelete", s:kyotonight11_gui, "", s:kyotonight11_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:kyotonight14_gui, "", s:kyotonight14_term, "", "", "")
call s:hi("SignifySignChange", s:kyotonight13_gui, "", s:kyotonight13_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:kyotonight11_gui, "", s:kyotonight11_term, "", "", "")
call s:hi("SignifySignDelete", s:kyotonight11_gui, "", s:kyotonight11_term, "", "", "")

" Sneak
" > justinmk/vim-sneak
hi! link Sneak Search

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:kyotonight11_gui, "", s:kyotonight11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:kyotonight11_gui, "", s:kyotonight11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:kyotonight14_gui, "", s:kyotonight14_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:kyotonight4_gui, s:kyotonight3_gui, "", s:kyotonight3_term, "", "")
call s:hi("jediFat", s:kyotonight8_gui, s:kyotonight3_gui, s:kyotonight8_term, s:kyotonight3_term, s:underline.s:bold, "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-clap
" > liuchengxu/vim-clap
call s:hi("ClapDir", s:kyotonight4_gui, "", "", "", "", "")
call s:hi("ClapDisplay", s:kyotonight4_gui, s:kyotonight1_gui, "", s:kyotonight1_term, "", "")
call s:hi("ClapFile", s:kyotonight4_gui, "", "", "NONE", "", "")
call s:hi("ClapMatches", s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
call s:hi("ClapNoMatchesFound", s:kyotonight13_gui, "", s:kyotonight13_term, "", "", "")
call s:hi("ClapSelected", s:kyotonight7_gui, "", s:kyotonight7_term, "", s:bold, "")
call s:hi("ClapSelectedSign", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
let s:clap_matches = [
        \ [s:kyotonight8_gui,  s:kyotonight8_term] ,
        \ [s:kyotonight9_gui,  s:kyotonight9_term] ,
        \ [s:kyotonight10_gui, s:kyotonight10_term] ,
        \ ]
for s:kyotonight_clap_match_i in range(1,12)
  let clap_match_color = s:clap_matches[s:kyotonight_clap_match_i % len(s:clap_matches) - 1]
  call s:hi("ClapMatches" . s:kyotonight_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
  call s:hi("ClapFuzzyMatches" . s:kyotonight_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
endfor
unlet s:kyotonight_clap_match_i
hi! link ClapCurrentSelection PmenuSel
hi! link ClapCurrentSelectionSign ClapSelectedSign
hi! link ClapInput Pmenu
hi! link ClapPreview Pmenu
hi! link ClapProviderAbout ClapDisplay
hi! link ClapProviderColon Type
hi! link ClapProviderId Type

" vim-indent-guides
" > nathanaelkane/vim-indent-guides
call s:hi("IndentGuidesEven", "", s:kyotonight1_gui, "", s:kyotonight1_term, "", "")
call s:hi("IndentGuidesOdd", "", s:kyotonight2_gui, "", s:kyotonight3_term, "", "")

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:kyotonight11_gui, "", "", s:kyotonight11_term, "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")

" vim-startify
" > mhinz/vim-startify
call s:hi("StartifyFile", s:kyotonight6_gui, "", s:kyotonight6_term, "", "", "")
call s:hi("StartifyFooter", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("StartifyHeader", s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
call s:hi("StartifyNumber", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("StartifyPath", s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
hi! link StartifyBracket Delimiter
hi! link StartifySlash Normal
hi! link StartifySpecial Comment

" dashboard-nvim
" > glepnir/dashboard-nvim
call s:hi("DashboardHeader", s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
call s:hi("DashboardCenter", s:kyotonight6_gui, "", s:kyotonight6_term, "", "", "")
call s:hi("DashboardFooter", s:kyotonight13_gui, "", s:kyotonight13_term, "", s:italic, "")
call s:hi("DashboardShortCut", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")

" nvim-tree.lua
" > nvim-tree/nvim-tree.lua
call s:hi("NvimTreeNormal", s:kyotonight4_gui, s:kyotonight0_gui, s:kyotonight4_term, "", "", "")
call s:hi("NvimTreeWinSeparator", s:kyotonight0_gui, s:kyotonight0_gui, s:kyotonight3_term, "", "", "")
call s:hi("NvimTreeNormalNC", s:kyotonight4_gui, s:kyotonight0_gui, s:kyotonight4_term, "", "", "")
call s:hi("NvimTreeRootFolder", s:kyotonight15_gui, s:kyotonight0_gui, s:kyotonight15_term, "", s:bold, "")

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi("haskellPreProc", s:kyotonight10_gui, "", s:kyotonight10_term, "", "", "")
call s:hi("haskellType", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
hi! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:kyotonight8_gui, "", s:kyotonight8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Pandoc
" > vim-pandoc/vim-pandoc-syntax
call s:hi("pandocDefinitionBlockTerm", s:kyotonight7_gui, "", s:kyotonight7_term, "", s:italic, "")
call s:hi("pandocTableDelims", s:kyotonight3_gui, "", s:kyotonight3_term, "", "", "")
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
  hi! link TSConstructor Function
  hi! link TSEmphasis Italic
  hi! link TSFuncBuiltin Function
  hi! link TSFuncMacro Function
  hi! link TSStringRegex SpecialChar
  hi! link TSStrong Bold
  hi! link TSStructure Structure
  hi! link TSTagDelimiter TSTag
  hi! link TSUnderline Underline
  hi! link TSVariable Variable
  hi! link TSVariableBuiltin Keyword
endif

" TypeScript
" > HerringtonDarkholme/yats.vim
call s:hi("typescriptBOMWindowMethod", s:kyotonight8_gui, "", s:kyotonight8_term, "", s:italic, "")
call s:hi("typescriptClassName", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("typescriptDecorator", s:kyotonight12_gui, "", s:kyotonight12_term, "", "", "")
call s:hi("typescriptInterfaceName", s:kyotonight7_gui, "", s:kyotonight7_term, "", s:bold, "")
call s:hi("typescriptRegexpString", s:kyotonight13_gui, "", s:kyotonight13_term, "", "", "")
" TypeScript JSX
 call s:hi("tsxAttrib", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
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
call s:hi("mkdCode", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("mkdFootnote", s:kyotonight8_gui, "", s:kyotonight8_term, "", "", "")
call s:hi("mkdRule", s:kyotonight10_gui, "", s:kyotonight10_term, "", "", "")
call s:hi("mkdLineBreak", s:kyotonight9_gui, "", s:kyotonight9_term, "", "", "")
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
call s:hi("phpClass", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")
call s:hi("phpClassImplements", s:kyotonight7_gui, "", s:kyotonight7_term, "", s:bold, "")
hi! link phpClassExtends phpClass
hi! link phpFunction Function
hi! link phpMethod Function
hi! link phpUseClass phpClass

" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:kyotonight8_gui, "", s:kyotonight8_term, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolor_guifg = [s:kyotonight7_gui, s:kyotonight8_gui, s:kyotonight9_gui, s:kyotonight10_gui, s:kyotonight14_gui, s:kyotonight15_gui]
  let s:vimwiki_hcolor_ctermfg = [s:kyotonight7_term, s:kyotonight8_term, s:kyotonight9_term, s:kyotonight10_term, s:kyotonight14_term, s:kyotonight15_term]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", s:bold, "")
  endfor
endif
call s:hi("VimwikiLink", s:kyotonight8_gui, "", s:kyotonight8_term, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:kyotonight7_gui, "", s:kyotonight7_term, "", "", "")

"+------------+
"+ Public API +
"+------------+
"+--- Functions ---+

function! KyotonightPalette() abort
  let ret = {}
  for color in range(16)
    execute 'let ret["kyotonight'.color.'"] = s:kyotonight'.color.'_gui'
  endfor
  let ret["kyotonight3_bright"] = s:kyotonight3_gui_bright
  return ret
endfunction

