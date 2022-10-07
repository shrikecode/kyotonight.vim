" Copyright (C) 2022-present Wojciech M. Wnuk <laniusone@pm.me>

" Project: Kyoto Night Vim
" Repository: https://github.com/laniusone/kyotonight.vim
" License: MIT

let s:kyotonight_vim_version="0.0.1"
let g:airline#themes#kyotonight#palette = {}

let s:kyotonight0_gui  = "#1a1b26"
let s:kyotonight1_gui  = "#24283b"
let s:kyotonight2_gui  = "#414868"
let s:kyotonight3_gui  = "#565f89"
let s:kyotonight4_gui  = "#a9b1d6"
let s:kyotonight5_gui  = "#cfc9c2"
let s:kyotonight6_gui  = "#d5d6db"
let s:kyotonight7_gui  = "#73daca"
let s:kyotonight8_gui  = "#7dcfff"
let s:kyotonight9_gui  = "#7aa2f7"
let s:kyotonight10_gui = "#b4f9f8"
let s:kyotonight11_gui = "#f7768e"
let s:kyotonight12_gui = "#ff9e64"
let s:kyotonight13_gui = "#e0af68"
let s:kyotonight14_gui = "#9ece6a"
let s:kyotonight15_gui = "#bb9af7"

let s:kyotonight0_term = "NONE"
let s:kyotonight1_term = "0"
let s:kyotonight2_term = "NONE"
let s:kyotonight4_term = "NONE"
let s:kyotonight11_term = "1"
let s:kyotonight14_term = "2"
let s:kyotonight13_term = "3"
let s:kyotonight9_term = "4"
let s:kyotonight15_term = "5"
let s:kyotonight8_term = "6"
let s:kyotonight5_term = "7"
let s:kyotonight3_term = "8"
let s:kyotonight12_term = "11"
let s:kyotonight10_term = "12"
let s:kyotonight7_term = "14"
let s:kyotonight6_term = "15"

let s:NMain = [s:kyotonight1_gui, s:kyotonight8_gui, s:kyotonight1_term, s:kyotonight8_term]
let s:NRight = [s:kyotonight1_gui, s:kyotonight9_gui, s:kyotonight1_term, s:kyotonight9_term]
let s:NMiddle = [s:kyotonight5_gui, s:kyotonight3_gui, s:kyotonight5_term, s:kyotonight3_term]
let s:NWarn = [s:kyotonight1_gui, s:kyotonight13_gui, s:kyotonight3_term, s:kyotonight13_term]
let s:NError = [s:kyotonight0_gui, s:kyotonight11_gui, s:kyotonight1_term, s:kyotonight11_term]
let g:airline#themes#kyotonight#palette.normal = airline#themes#generate_color_map(s:NMain, s:NRight, s:NMiddle)
let g:airline#themes#kyotonight#palette.normal.airline_warning = s:NWarn
let g:airline#themes#kyotonight#palette.normal.airline_error = s:NError

let s:IMain = [s:kyotonight1_gui, s:kyotonight14_gui, s:kyotonight1_term, s:kyotonight6_term]
let s:IRight = [s:kyotonight1_gui, s:kyotonight9_gui, s:kyotonight1_term, s:kyotonight9_term]
let s:IMiddle = [s:kyotonight5_gui, s:kyotonight3_gui, s:kyotonight5_term, s:kyotonight3_term]
let s:IWarn = [s:kyotonight1_gui, s:kyotonight13_gui, s:kyotonight3_term, s:kyotonight13_term]
let s:IError = [s:kyotonight0_gui, s:kyotonight11_gui, s:kyotonight1_term, s:kyotonight11_term]
let g:airline#themes#kyotonight#palette.insert = airline#themes#generate_color_map(s:IMain, s:IRight, s:IMiddle)
let g:airline#themes#kyotonight#palette.insert.airline_warning = s:IWarn
let g:airline#themes#kyotonight#palette.insert.airline_error = s:IError

let s:RMain = [s:kyotonight1_gui, s:kyotonight14_gui, s:kyotonight1_term, s:kyotonight14_term]
let s:RRight = [s:kyotonight1_gui, s:kyotonight9_gui, s:kyotonight1_term, s:kyotonight9_term]
let s:RMiddle = [s:kyotonight5_gui, s:kyotonight3_gui, s:kyotonight5_term, s:kyotonight3_term]
let s:RWarn = [s:kyotonight1_gui, s:kyotonight13_gui, s:kyotonight3_term, s:kyotonight13_term]
let s:RError = [s:kyotonight0_gui, s:kyotonight11_gui, s:kyotonight1_term, s:kyotonight11_term]
let g:airline#themes#kyotonight#palette.replace = airline#themes#generate_color_map(s:RMain, s:RRight, s:RMiddle)
let g:airline#themes#kyotonight#palette.replace.airline_warning = s:RWarn
let g:airline#themes#kyotonight#palette.replace.airline_error = s:RError

let s:VMain = [s:kyotonight1_gui, s:kyotonight7_gui, s:kyotonight1_term, s:kyotonight7_term]
let s:VRight = [s:kyotonight1_gui, s:kyotonight9_gui, s:kyotonight1_term, s:kyotonight9_term]
let s:VMiddle = [s:kyotonight5_gui, s:kyotonight3_gui, s:kyotonight5_term, s:kyotonight3_term]
let s:VWarn = [s:kyotonight1_gui, s:kyotonight13_gui, s:kyotonight3_term, s:kyotonight13_term]
let s:VError = [s:kyotonight0_gui, s:kyotonight11_gui, s:kyotonight1_term, s:kyotonight11_term]
let g:airline#themes#kyotonight#palette.visual = airline#themes#generate_color_map(s:VMain, s:VRight, s:VMiddle)
let g:airline#themes#kyotonight#palette.visual.airline_warning = s:VWarn
let g:airline#themes#kyotonight#palette.visual.airline_error = s:VError

let s:IAMain = [s:kyotonight5_gui, s:kyotonight3_gui, s:kyotonight5_term, s:kyotonight3_term]
let s:IARight = [s:kyotonight5_gui, s:kyotonight3_gui, s:kyotonight5_term, s:kyotonight3_term]
if g:kyotonight_uniform_status_lines == 0
  let s:IAMiddle = [s:kyotonight5_gui, s:kyotonight1_gui, s:kyotonight5_term, s:kyotonight1_term]
else
  let s:IAMiddle = [s:kyotonight5_gui, s:kyotonight3_gui, s:kyotonight5_term, s:kyotonight3_term]
endif
let s:IAWarn = [s:kyotonight1_gui, s:kyotonight13_gui, s:kyotonight3_term, s:kyotonight13_term]
let s:IAError = [s:kyotonight0_gui, s:kyotonight11_gui, s:kyotonight1_term, s:kyotonight11_term]
let g:airline#themes#kyotonight#palette.inactive = airline#themes#generate_color_map(s:IAMain, s:IARight, s:IAMiddle)
let g:airline#themes#kyotonight#palette.inactive.airline_warning = s:IAWarn
let g:airline#themes#kyotonight#palette.inactive.airline_error = s:IAError

let g:airline#themes#kyotonight#palette.normal.airline_term = s:NMiddle
let g:airline#themes#kyotonight#palette.insert.airline_term = s:IMiddle
let g:airline#themes#kyotonight#palette.replace.airline_term = s:RMiddle
let g:airline#themes#kyotonight#palette.visual.airline_term = s:VMiddle
let g:airline#themes#kyotonight#palette.inactive.airline_term = s:IAMiddle
