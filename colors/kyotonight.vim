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
let s:kyotonight_vim_version="0.0.2"
set background=dark

let s:kn_blackest_gui    = "#0f0f14"
let s:kn_bg_gui          = "#1a1b26"
let s:kn_blacklight_gui  = "#24283b"
let s:kn_grey_gui        = "#414868"
let s:kn_grey_gui_bright = "#565f89"
let s:kn_fg_gui          = "#a9b1d6"
let s:kn_greylight_gui   = "#cfc9c2"
let s:kn_cyanlight_gui   = "#b4f9f8"
let s:kn_teal_gui        = "#73daca"
let s:kn_bluelight_gui   = "#7dcfff"
let s:kn_blue_gui        = "#7aa2f7"
let s:kn_cyan_gui        = "#2ac3de"
let s:kn_red_gui         = "#f7768e"
let s:kn_orange_gui      = "#ff9e64"
let s:kn_yellow_gui      = "#e0af68"
let s:kn_green_gui       = "#9ece6a"
let s:kn_magenta_gui     = "#bb9af7"

let s:kn_bg_term = "0"
let s:kn_grey_term = "8"
let s:kn_greylight_term = "7"
let s:kn_cyanlight_term = "15"
let s:kn_teal_term = "14"
let s:kn_bluelight_term = "6"
let s:kn_blue_term = "4"
let s:kn_cyan_term = "12"
let s:kn_red_term = "1"
let s:kn_orange_term = "11"
let s:kn_yellow_term = "3"
let s:kn_green_term = "2"
let s:kn_magenta_term = "5"

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
call s:hi("ColorColumn", "", s:kn_blacklight_gui, "NONE", s:kn_bg_term, "", "")
call s:hi("Cursor", s:kn_bg_gui, s:kn_fg_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:kn_blackest_gui, "NONE", s:kn_bg_term, "NONE", "")
call s:hi("Error", s:kn_bg_gui, s:kn_red_gui, "", s:kn_red_term, "", "")
call s:hi("iCursor", s:kn_blackest_gui, s:kn_fg_gui, "", "NONE", "", "")
call s:hi("LineNr", s:kn_grey_gui, "NONE", s:kn_grey_term, "NONE", "", "")
call s:hi("MatchParen", s:kn_bluelight_gui, s:kn_grey_gui, s:kn_bluelight_term, s:kn_grey_term, "", "")
call s:hi("NonText", s:kn_blacklight_gui, "", s:kn_grey_term, "", "", "")
call s:hi("Normal", s:kn_fg_gui, s:kn_bg_gui, "NONE", "NONE", "", "")
call s:hi("Pmenu", s:kn_fg_gui, s:kn_blacklight_gui, "NONE", s:kn_bg_term, "NONE", "")
call s:hi("PmenuSbar", s:kn_fg_gui, s:kn_blacklight_gui, "NONE", s:kn_bg_term, "", "")
call s:hi("PmenuSel", s:kn_bluelight_gui, s:kn_grey_gui, s:kn_bluelight_term, s:kn_grey_term, "", "")
call s:hi("PmenuThumb", s:kn_bluelight_gui, s:kn_grey_gui, "NONE", s:kn_grey_term, "", "")
call s:hi("SpecialKey", s:kn_grey_gui, "", s:kn_grey_term, "", "", "")
call s:hi("SpellBad", s:kn_red_gui, s:kn_bg_gui, s:kn_red_term, "NONE", "undercurl", s:kn_red_gui)
call s:hi("SpellCap", s:kn_orange_gui, s:kn_bg_gui, s:kn_orange_term, "NONE", "undercurl", s:kn_orange_gui)
call s:hi("SpellLocal", s:kn_yellow_gui, s:kn_bg_gui, s:kn_yellow_term, "NONE", "undercurl", s:kn_yellow_gui)
call s:hi("SpellRare", s:kn_cyanlight_gui, s:kn_bg_gui, s:kn_cyanlight_term, "NONE", "undercurl", s:kn_cyanlight_gui)
call s:hi("Visual", "", s:kn_grey_gui, "", s:kn_bg_term, "", "")
call s:hi("VisualNOS", "", s:kn_grey_gui, "", s:kn_bg_term, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [s:kn_bg_gui, s:kn_red_gui, s:kn_green_gui, s:kn_yellow_gui, s:kn_blue_gui, s:kn_magenta_gui, s:kn_bluelight_gui, s:kn_greylight_gui, s:kn_grey_gui, s:kn_red_gui, s:kn_green_gui, s:kn_yellow_gui, s:kn_blue_gui, s:kn_magenta_gui, s:kn_teal_gui, s:kn_cyanlight_gui]
endif

if has('nvim')
  "+- Neovim Terminal Colors -+
  let g:terminal_color_0 = s:kn_bg_gui
  let g:terminal_color_1 = s:kn_red_gui
  let g:terminal_color_2 = s:kn_green_gui
  let g:terminal_color_3 = s:kn_yellow_gui
  let g:terminal_color_4 = s:kn_blue_gui
  let g:terminal_color_5 = s:kn_magenta_gui
  let g:terminal_color_6 = s:kn_bluelight_gui
  let g:terminal_color_7 = s:kn_greylight_gui
  let g:terminal_color_8 = s:kn_grey_gui
  let g:terminal_color_9 = s:kn_red_gui
  let g:terminal_color_10 = s:kn_green_gui
  let g:terminal_color_11 = s:kn_yellow_gui
  let g:terminal_color_12 = s:kn_blue_gui
  let g:terminal_color_13 = s:kn_magenta_gui
  let g:terminal_color_14 = s:kn_teal_gui
  let g:terminal_color_15 = s:kn_cyanlight_gui

  "+- Neovim Support -+
  call s:hi("healthError", s:kn_red_gui, s:kn_bg_gui, s:kn_red_term, s:kn_bg_term, "", "")
  call s:hi("healthSuccess", s:kn_green_gui, s:kn_bg_gui, s:kn_green_term, s:kn_bg_term, "", "")
  call s:hi("healthWarning", s:kn_yellow_gui, s:kn_bg_gui, s:kn_yellow_term, s:kn_bg_term, "", "")
  call s:hi("TermCursorNC", "", s:kn_bg_gui, "", s:kn_bg_term, "", "")

  "+- Neovim Diagnostics API -+
  call s:hi("DiagnosticWarn", s:kn_yellow_gui, "", s:kn_yellow_term, "", "", "")
  call s:hi("DiagnosticError" , s:kn_red_gui, "", s:kn_red_term, "", "", "")
  call s:hi("DiagnosticInfo" , s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
  call s:hi("DiagnosticHint" , s:kn_cyanlight_gui, "", s:kn_cyanlight_term, "", "", "")
  call s:hi("DiagnosticSignWarn", s:kn_yellow_gui, "", s:kn_yellow_term, "", "", "")
  call s:hi("DiagnosticSignError" , s:kn_red_gui, "", s:kn_red_term, "", "", "")
  call s:hi("DiagnosticSignInfo" , s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
  call s:hi("DiagnosticSignHint" , s:kn_cyanlight_gui, "", s:kn_cyanlight_term, "", "", "")
  call s:hi("DiagnosticUnderlineWarn" , s:kn_yellow_gui, "", s:kn_yellow_term, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineError" , s:kn_red_gui, "", s:kn_red_term, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineInfo" , s:kn_blue_gui, "", s:kn_blue_term, "", "undercurl", "")
  call s:hi("DiagnosticUnderlineHint" , s:kn_cyanlight_gui, "", s:kn_cyanlight_term, "", "undercurl", "")

  "+- Neovim DocumentHighlight -+
  call s:hi("LspReferenceText", "", s:kn_grey_gui, "", s:kn_grey_term, "", "")
  call s:hi("LspReferenceRead", "", s:kn_grey_gui, "", s:kn_grey_term, "", "")
  call s:hi("LspReferenceWrite", "", s:kn_grey_gui, "", s:kn_grey_term, "", "")

  "+- Neovim LspSignatureHelp -+
  call s:hi("LspSignatureActiveParameter", s:kn_blue_gui, "", s:kn_blue_term, "", s:underline, "")
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:kn_bg_gui, "NONE", s:kn_bg_term, "", "")
if g:kyotonight_cursor_line_number_background == 0
  call s:hi("CursorLineNr", s:kn_fg_gui, "", "NONE", "", "NONE", "")
else
  call s:hi("CursorLineNr", s:kn_fg_gui, s:kn_blackest_gui, "NONE", s:kn_bg_term, "NONE", "")
endif
call s:hi("Folded", s:kn_grey_gui, s:kn_bg_gui, s:kn_grey_term, s:kn_bg_term, s:bold, "")
call s:hi("FoldColumn", s:kn_grey_gui, s:kn_bg_gui, s:kn_grey_term, "NONE", "", "")
call s:hi("SignColumn", s:kn_bg_gui, s:kn_bg_gui, s:kn_bg_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:kn_blue_gui, "", s:kn_blue_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:kn_bg_gui, "", s:kn_bg_term, "NONE", "", "")
call s:hi("ErrorMsg", s:kn_bg_gui, s:kn_red_gui, "NONE", s:kn_red_term, "", "")
call s:hi("ModeMsg", s:kn_fg_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
call s:hi("Question", s:kn_fg_gui, "", "NONE", "", "", "")
if g:kyotonight_uniform_status_lines == 0
  call s:hi("StatusLine", s:kn_blue_gui, s:kn_grey_gui, s:kn_blue_term, s:kn_grey_term, "NONE", "")
  call s:hi("StatusLineNC", s:kn_fg_gui, s:kn_bg_gui, "NONE", s:kn_bg_term, "NONE", "")
  call s:hi("StatusLineTerm", s:kn_blue_gui, s:kn_grey_gui, s:kn_blue_term, s:kn_grey_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:kn_fg_gui, s:kn_bg_gui, "NONE", s:kn_bg_term, "NONE", "")
else
  call s:hi("StatusLine", s:kn_blue_gui, s:kn_grey_gui, s:kn_blue_term, s:kn_grey_term, "NONE", "")
  call s:hi("StatusLineNC", s:kn_fg_gui, s:kn_grey_gui, "NONE", s:kn_grey_term, "NONE", "")
  call s:hi("StatusLineTerm", s:kn_blue_gui, s:kn_grey_gui, s:kn_blue_term, s:kn_grey_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:kn_fg_gui, s:kn_grey_gui, "NONE", s:kn_grey_term, "NONE", "")
endif
call s:hi("WarningMsg", s:kn_bg_gui, s:kn_yellow_gui, s:kn_bg_term, s:kn_yellow_term, "", "")
call s:hi("WildMenu", s:kn_blue_gui, s:kn_bg_gui, s:kn_blue_term, s:kn_bg_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:kn_cyanlight_gui, s:kn_blue_gui, s:kn_cyanlight_term, s:kn_blue_term, s:underline, "")
call s:hi("Search", s:kn_bg_gui, s:kn_blue_gui, s:kn_bg_term, s:kn_blue_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:kn_fg_gui, s:kn_bg_gui, "NONE", s:kn_bg_term, "NONE", "")
call s:hi("TabLineFill", s:kn_grey_gui, s:kn_blackest_gui, "NONE", s:kn_bg_term, "NONE", "")
call s:hi("TabLineSel", s:kn_grey_gui, s:kn_bg_gui, s:kn_bluelight_term, s:kn_grey_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:kn_fg_gui, "", "NONE", "", "NONE", "")

if g:kyotonight_bold_vertical_split_line == 0
  call s:hi("VertSplit", s:kn_grey_gui, s:kn_bg_gui, s:kn_grey_term, "NONE", "NONE", "")
else
  call s:hi("VertSplit", s:kn_blackest_gui, s:kn_blackest_gui, s:kn_grey_term, s:kn_grey_term, "NONE", "")
endif

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:kn_orange_gui, "", s:kn_orange_term, "", "", "")
call s:hi("Character", s:kn_green_gui, "", s:kn_green_term, "", "", "")
call s:hi("Comment", s:kn_grey_gui_bright, "", s:kn_grey_term, "", s:italicize_comments, "")
call s:hi("Conceal", "", "NONE", "", "NONE", "", "")
call s:hi("Conditional", s:kn_magenta_gui, "", s:kn_magenta_term, "", "", "")
call s:hi("Constant", s:kn_greylight_gui, "", s:kn_greylight_term, "", s:italic, "")
call s:hi("Decorator", s:kn_orange_gui, "", s:kn_orange_term, "", "", "")
call s:hi("Define", s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
call s:hi("Delimiter", s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
call s:hi("Exception", s:kn_magenta_gui, "", s:kn_magenta_term, "", "", "") 
call s:hi("Float", s:kn_orange_gui, "", s:kn_orange_term, "", "", "")
call s:hi("Function", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")
call s:hi("Identifier", s:kn_blue_gui, "", s:kn_blue_term, "", s:italic, "")
call s:hi("Variable", s:kn_fg_gui, "", "NONE", "", "", "")
call s:hi("Include", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "") 
call s:hi("Keyword", s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
call s:hi("Label", s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
call s:hi("Number", s:kn_orange_gui, "", s:kn_orange_term, "", "", "")
call s:hi("Operator", s:kn_magenta_gui, "", s:kn_magenta_term, "", "NONE", "")
call s:hi("PreProc", s:kn_blue_gui, "", s:kn_blue_term, "", "NONE", "")
call s:hi("Repeat", s:kn_magenta_gui, "", s:kn_magenta_term, "", "", "")
call s:hi("Special", s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
call s:hi("SpecialChar", s:kn_yellow_gui, "", s:kn_yellow_term, "", "", "")
call s:hi("SpecialComment", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", s:italicize_comments, "")
call s:hi("Statement", s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
call s:hi("StorageClass", s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
call s:hi("String", s:kn_green_gui, "", s:kn_green_term, "", "", "")
call s:hi("Structure", s:kn_magenta_gui, "", s:kn_magenta_term, "", "", "") 
call s:hi("Tag", s:kn_fg_gui, "", "", "", "", "")
call s:hi("Todo", s:kn_yellow_gui, "NONE", s:kn_yellow_term, "NONE", "", "")
call s:hi("Type", s:kn_teal_gui, "", s:kn_teal_term, "", "NONE", "")
call s:hi("Typedef", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
hi! link Annotation Decorator
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:kn_cyan_gui, "", s:kn_cyan_term, "", "", "")
call s:hi("asciidocAttributeList", s:kn_cyan_gui, "", s:kn_cyan_term, "", "", "")
call s:hi("asciidocAttributeRef", s:kn_cyan_gui, "", s:kn_cyan_term, "", "", "")
call s:hi("asciidocHLabel", s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
call s:hi("asciidocListingBlock", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("asciidocMacroAttributes", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")
call s:hi("asciidocOneLineTitle", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")
call s:hi("asciidocPassthroughBlock", s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
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

call s:hi("awkCharClass", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("awkPatterns", s:kn_blue_gui, "", s:kn_blue_term, "", s:bold, "")
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

call s:hi("cIncluded", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit
hi! link cConstant Type

call s:hi("cmakeGeneratorExpression", s:kn_cyan_gui, "", s:kn_cyan_term, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("cssDefinition", s:kn_teal_gui, "", s:kn_teal_term, "", "NONE", "")
call s:hi("cssIdentifier", s:kn_teal_gui, "", s:kn_teal_term, "", s:underline, "")
call s:hi("cssStringQ", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("dtExecKey", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("dtLocaleKey", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("dtNumericKey", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("dtTypeKey", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:kyotonight_uniform_diff_background == 0
  call s:hi("DiffAdd", s:kn_green_gui, s:kn_blackest_gui, s:kn_green_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:kn_yellow_gui, s:kn_blackest_gui, s:kn_yellow_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:kn_red_gui, s:kn_blackest_gui, s:kn_red_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:kn_blue_gui, s:kn_blackest_gui, s:kn_blue_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:kn_green_gui, s:kn_bg_gui, s:kn_green_term, s:kn_bg_term, "", "")
  call s:hi("DiffChange", s:kn_yellow_gui, s:kn_bg_gui, s:kn_yellow_term, s:kn_bg_term, "", "")
  call s:hi("DiffDelete", s:kn_red_gui, s:kn_bg_gui, s:kn_red_term, s:kn_bg_term, "", "")
  call s:hi("DiffText", s:kn_blue_gui, s:kn_bg_gui, s:kn_blue_term, s:kn_bg_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")

call s:hi("goBuiltins", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:kn_grey_gui, "", s:kn_grey_term, "", "", "")
call s:hi("helpHyperTextJump", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", s:underline, "")

call s:hi("htmlArg", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("htmlLink", s:kn_fg_gui, "", "", "", "NONE", "NONE")
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

call s:hi("javaDocTags", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")

call s:hi("lessClass", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
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

call s:hi("markdownBlockquote", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("markdownCode", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("markdownFootnote", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("markdownId", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("markdownIdDeclaration", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("markdownH1", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")
call s:hi("markdownLinkText", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")
call s:hi("markdownUrl", s:kn_fg_gui, "", "NONE", "", "NONE", "")
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

call s:hi("perlPackageDecl", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")

call s:hi("phpClasses", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("phpDocTags", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("podVerbatimLine", s:kn_fg_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("rubySymbol", s:kn_cyanlight_gui, "", s:kn_cyanlight_term, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", s:kn_cyan_gui, "", s:kn_cyan_term, "", "", "")
call s:hi("rustEnum", s:kn_teal_gui, "", s:kn_teal_term, "", s:bold, "")
call s:hi("rustMacro", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", s:bold, "")
call s:hi("rustModPath", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("rustPanic", s:kn_blue_gui, "", s:kn_blue_term, "", s:bold, "")
call s:hi("rustTrait", s:kn_teal_gui, "", s:kn_teal_term, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("sassId", s:kn_teal_gui, "", s:kn_teal_term, "", s:underline, "")
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

call s:hi("vimAugroup", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("vimMapRhs", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("vimNotation", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("xmlCdataStart", s:kn_grey_gui_bright, "", s:kn_grey_term, "", s:bold, "")
call s:hi("xmlNamespace", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:kn_yellow_gui, "", s:kn_yellow_term, "", "", "")
call s:hi("ALEErrorSign" , s:kn_red_gui, "", s:kn_red_term, "", "", "")
call s:hi("ALEWarning" , s:kn_yellow_gui, "", s:kn_yellow_term, "", "undercurl", "")
call s:hi("ALEError" , s:kn_red_gui, "", s:kn_red_term, "", "undercurl", "")

" Coc
" > neoclide/coc.vim
call s:hi("CocWarningHighlight" , s:kn_yellow_gui, "", s:kn_yellow_term, "", "undercurl", "")
call s:hi("CocErrorHighlight" , s:kn_red_gui, "", s:kn_red_term, "", "undercurl", "")
call s:hi("CocInfoHighlight" , s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "undercurl", "")
call s:hi("CocHintHighlight" , s:kn_blue_gui, "", s:kn_blue_term, "", "undercurl", "")
call s:hi("CocWarningSign", s:kn_yellow_gui, "", s:kn_yellow_term, "", "", "")
call s:hi("CocErrorSign" , s:kn_red_gui, "", s:kn_red_term, "", "", "")
call s:hi("CocInfoSign" , s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")
call s:hi("CocHintSign" , s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
call s:hi("CocSearch" , s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")
call s:hi("CocNotificationProgress" , s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")

if has('nvim')
  " Neovim LSP
  " > neovim/nvim-lspconfig
  call s:hi("LspCodeLens", s:kn_grey_gui_bright, "", s:kn_grey_term, "", "", "")
  if has("nvim-0.5")
    call s:hi("LspDiagnosticsDefaultWarning", s:kn_yellow_gui, "", s:kn_yellow_term, "", "", "")
    call s:hi("LspDiagnosticsDefaultError" , s:kn_red_gui, "", s:kn_red_term, "", "", "")
    call s:hi("LspDiagnosticsDefaultInformation" , s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")
    call s:hi("LspDiagnosticsDefaultHint" , s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
    call s:hi("LspDiagnosticsUnderlineWarning" , s:kn_yellow_gui, "", s:kn_yellow_term, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineError" , s:kn_red_gui, "", s:kn_red_term, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineInformation" , s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "undercurl", "")
    call s:hi("LspDiagnosticsUnderlineHint" , s:kn_blue_gui, "", s:kn_blue_term, "", "undercurl", "")
  endif
  
  " Gitsigns
  " > lewis6991/gitsigns.nvim
  hi! link GitSignsCurrentLineBlame Comment
endif

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:kn_green_gui, "", s:kn_green_term, "", "", "")
call s:hi("GitGutterChange", s:kn_yellow_gui, "", s:kn_yellow_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:kn_red_gui, "", s:kn_red_term, "", "", "")
call s:hi("GitGutterDelete", s:kn_red_gui, "", s:kn_red_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:kn_green_gui, "", s:kn_green_term, "", "", "")
call s:hi("SignifySignChange", s:kn_yellow_gui, "", s:kn_yellow_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:kn_red_gui, "", s:kn_red_term, "", "", "")
call s:hi("SignifySignDelete", s:kn_red_gui, "", s:kn_red_term, "", "", "")

" Sneak
" > justinmk/vim-sneak
hi! link Sneak Search

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:kn_red_gui, "", s:kn_red_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:kn_red_gui, "", s:kn_red_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:kn_green_gui, "", s:kn_green_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:kn_fg_gui, s:kn_grey_gui, "", s:kn_grey_term, "", "")
call s:hi("jediFat", s:kn_bluelight_gui, s:kn_grey_gui, s:kn_bluelight_term, s:kn_grey_term, s:underline.s:bold, "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-clap
" > liuchengxu/vim-clap
call s:hi("ClapDir", s:kn_fg_gui, "", "", "", "", "")
call s:hi("ClapDisplay", s:kn_fg_gui, s:kn_bg_gui, "", s:kn_bg_term, "", "")
call s:hi("ClapFile", s:kn_fg_gui, "", "", "NONE", "", "")
call s:hi("ClapMatches", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")
call s:hi("ClapNoMatchesFound", s:kn_yellow_gui, "", s:kn_yellow_term, "", "", "")
call s:hi("ClapSelected", s:kn_teal_gui, "", s:kn_teal_term, "", s:bold, "")
call s:hi("ClapSelectedSign", s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
let s:clap_matches = [
        \ [s:kn_bluelight_gui,  s:kn_bluelight_term] ,
        \ [s:kn_blue_gui,  s:kn_blue_term] ,
        \ [s:kn_cyan_gui, s:kn_cyan_term] ,
        \ ]
for s:kn_night_clap_match_i in range(1,12)
  let clap_match_color = s:clap_matches[s:kn_night_clap_match_i % len(s:clap_matches) - 1]
  call s:hi("ClapMatches" . s:kn_night_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
  call s:hi("ClapFuzzyMatches" . s:kn_night_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
endfor
unlet s:kn_night_clap_match_i
hi! link ClapCurrentSelection PmenuSel
hi! link ClapCurrentSelectionSign ClapSelectedSign
hi! link ClapInput Pmenu
hi! link ClapPreview Pmenu
hi! link ClapProviderAbout ClapDisplay
hi! link ClapProviderColon Type
hi! link ClapProviderId Type

" vim-indent-guides
" > nathanaelkane/vim-indent-guides
call s:hi("IndentGuidesEven", "", s:kn_bg_gui, "", s:kn_bg_term, "", "")
call s:hi("IndentGuidesOdd", "", s:kn_blacklight_gui, "", s:kn_grey_term, "", "")

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:kn_red_gui, "", "", s:kn_red_term, "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")

" vim-startify
" > mhinz/vim-startify
call s:hi("StartifyFile", s:kn_cyanlight_gui, "", s:kn_cyanlight_term, "", "", "")
call s:hi("StartifyFooter", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("StartifyHeader", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")
call s:hi("StartifyNumber", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("StartifyPath", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")
hi! link StartifyBracket Delimiter
hi! link StartifySlash Normal
hi! link StartifySpecial Comment

" dashboard-nvim
" > glepnir/dashboard-nvim
call s:hi("DashboardHeader", s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
call s:hi("DashboardCenter", s:kn_magenta_gui, "", s:kn_magenta_term, "", "", "")
call s:hi("DashboardFooter", s:kn_yellow_gui, "", s:kn_yellow_term, "", s:italic, "")
call s:hi("DashboardShortCut", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")

" nvim-tree.lua
" > nvim-tree/nvim-tree.lua
call s:hi("NvimTreeNormal", s:kn_fg_gui, s:kn_blackest_gui, s:kn_greylight_term, "", "", "")
call s:hi("NvimTreeWinSeparator", s:kn_blackest_gui, s:kn_blackest_gui, s:kn_grey_term, "", "", "")
call s:hi("NvimTreeNormalNC", s:kn_fg_gui, s:kn_blackest_gui, s:kn_greylight_term, "", "", "")
call s:hi("NvimTreeRootFolder", s:kn_magenta_gui, s:kn_blackest_gui, s:kn_magenta_term, "", s:bold, "")

" barbar.nvim
" > romgrk/barbar.nvim
call s:hi("BufferCurrentMod", s:kn_yellow_gui, s:kn_bg_gui, s:kn_yellow_term, "", "", "")
call s:hi("BufferVisibleMod", s:kn_yellow_gui, s:kn_grey_gui, s:kn_yellow_term, "", "", "")
call s:hi("BufferInactiveMod", s:kn_yellow_gui, s:kn_blackest_gui, s:kn_yellow_term, "", "", "")

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi("haskellPreProc", s:kn_cyan_gui, "", s:kn_cyan_term, "", "", "")
call s:hi("haskellType", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
hi! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Pandoc
" > vim-pandoc/vim-pandoc-syntax
call s:hi("pandocDefinitionBlockTerm", s:kn_teal_gui, "", s:kn_teal_term, "", s:italic, "")
call s:hi("pandocTableDelims", s:kn_grey_gui, "", s:kn_grey_term, "", "", "")
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
call s:hi("typescriptBOMWindowMethod", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", s:italic, "")
call s:hi("typescriptClassName", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("typescriptDecorator", s:kn_orange_gui, "", s:kn_orange_term, "", "", "")
call s:hi("typescriptInterfaceName", s:kn_teal_gui, "", s:kn_teal_term, "", s:bold, "")
call s:hi("typescriptRegexpString", s:kn_yellow_gui, "", s:kn_yellow_term, "", "", "")
" TypeScript JSX
 call s:hi("tsxAttrib", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
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
call s:hi("mkdCode", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("mkdFootnote", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", "", "")
call s:hi("mkdRule", s:kn_cyan_gui, "", s:kn_cyan_term, "", "", "")
call s:hi("mkdLineBreak", s:kn_blue_gui, "", s:kn_blue_term, "", "", "")
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
call s:hi("phpClass", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")
call s:hi("phpClassImplements", s:kn_teal_gui, "", s:kn_teal_term, "", s:bold, "")
hi! link phpClassExtends phpClass
hi! link phpFunction Function
hi! link phpMethod Function
hi! link phpUseClass phpClass

" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:kn_bluelight_gui, "", s:kn_bluelight_term, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolor_guifg = [s:kn_teal_gui, s:kn_bluelight_gui, s:kn_blue_gui, s:kn_cyan_gui, s:kn_green_gui, s:kn_magenta_gui]
  let s:vimwiki_hcolor_ctermfg = [s:kn_teal_term, s:kn_bluelight_term, s:kn_blue_term, s:kn_cyan_term, s:kn_green_term, s:kn_magenta_term]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", s:bold, "")
  endfor
endif
call s:hi("VimwikiLink", s:kn_bluelight_gui, "", s:kn_bluelight_term, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:kn_teal_gui, "", s:kn_teal_term, "", "", "")

