" Copyright (C) 2022-present Wojciech M. Wnuk <laniusone@pm.me>

" Project: Kyoto Night Vim
" Repository: https://github.com/laniusone/kyotonight.vim
" License: MIT

let s:kyotonight_vim_version="0.2.1"
let g:airline#themes#kyotonight#palette = {}

let s:none        = ["NONE", "NONE"]
let s:cl          = ["#292e42", "NONE"]
let s:hl          = ["#33467c", "7"]
let s:black0      = ["#0f0f14", "NONE"]
let s:bg          = ["#1a1b26", "0"]
let s:black1      = ["#24283b", "8"]
let s:grey0       = ["#414868", "7"]
let s:grey1       = ["#565f89", "15"]
let s:fg          = ["#a9b1d6", "NONE"]
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

let s:NMain = [s:bg[0], s:blue1[0], s:bg[1], s:blue1[1]]
let s:NRight = [s:bg[0], s:blue0[0], s:bg[1], s:blue0[1]]
let s:NMiddle = [s:grey1[0], s:grey0[0], s:grey1[1], s:grey0[1]]
let s:NWarn = [s:bg[0], s:yellow[0], s:grey0[1], s:yellow[1]]
let s:NError = [s:black0[0], s:red[0], s:bg[1], s:red[1]]
let g:airline#themes#kyotonight#palette.normal = airline#themes#generate_color_map(s:NMain, s:NRight, s:NMiddle)
let g:airline#themes#kyotonight#palette.normal.airline_warning = s:NWarn
let g:airline#themes#kyotonight#palette.normal.airline_error = s:NError

let s:IMain = [s:bg[0], s:green[0], s:bg[1], s:cyan1[1]]
let s:IRight = [s:bg[0], s:blue0[0], s:bg[1], s:blue0[1]]
let s:IMiddle = [s:grey1[0], s:grey0[0], s:grey1[1], s:grey0[1]]
let s:IWarn = [s:bg[0], s:yellow[0], s:grey0[1], s:yellow[1]]
let s:IError = [s:black0[0], s:red[0], s:bg[1], s:red[1]]
let g:airline#themes#kyotonight#palette.insert = airline#themes#generate_color_map(s:IMain, s:IRight, s:IMiddle)
let g:airline#themes#kyotonight#palette.insert.airline_warning = s:IWarn
let g:airline#themes#kyotonight#palette.insert.airline_error = s:IError

let s:RMain = [s:bg[0], s:green[0], s:bg[1], s:green[1]]
let s:RRight = [s:bg[0], s:blue0[0], s:bg[1], s:blue0[1]]
let s:RMiddle = [s:grey1[0], s:grey0[0], s:grey1[1], s:grey0[1]]
let s:RWarn = [s:bg[0], s:yellow[0], s:grey0[1], s:yellow[1]]
let s:RError = [s:black0[0], s:red[0], s:bg[1], s:red[1]]
let g:airline#themes#kyotonight#palette.replace = airline#themes#generate_color_map(s:RMain, s:RRight, s:RMiddle)
let g:airline#themes#kyotonight#palette.replace.airline_warning = s:RWarn
let g:airline#themes#kyotonight#palette.replace.airline_error = s:RError

let s:VMain = [s:bg[0], s:teal[0], s:bg[1], s:teal[1]]
let s:VRight = [s:bg[0], s:blue0[0], s:bg[1], s:blue0[1]]
let s:VMiddle = [s:grey1[0], s:grey0[0], s:grey1[1], s:grey0[1]]
let s:VWarn = [s:bg[0], s:yellow[0], s:grey0[1], s:yellow[1]]
let s:VError = [s:black0[0], s:red[0], s:bg[1], s:red[1]]
let g:airline#themes#kyotonight#palette.visual = airline#themes#generate_color_map(s:VMain, s:VRight, s:VMiddle)
let g:airline#themes#kyotonight#palette.visual.airline_warning = s:VWarn
let g:airline#themes#kyotonight#palette.visual.airline_error = s:VError

let s:IAMain = [s:grey1[0], s:grey0[0], s:grey1[1], s:grey0[1]]
let s:IARight = [s:grey1[0], s:grey0[0], s:grey1[1], s:grey0[1]]
if g:kyotonight_uniform_status_lines == 0
  let s:IAMiddle = [s:grey1[0], s:bg[0], s:grey1[1], s:bg[1]]
else
  let s:IAMiddle = [s:grey1[0], s:grey0[0], s:grey1[1], s:grey0[1]]
endif
let s:IAWarn = [s:bg[0], s:yellow[0], s:grey0[1], s:yellow[1]]
let s:IAError = [s:black0[0], s:red[0], s:bg[1], s:red[1]]
let g:airline#themes#kyotonight#palette.inactive = airline#themes#generate_color_map(s:IAMain, s:IARight, s:IAMiddle)
let g:airline#themes#kyotonight#palette.inactive.airline_warning = s:IAWarn
let g:airline#themes#kyotonight#palette.inactive.airline_error = s:IAError

let g:airline#themes#kyotonight#palette.normal.airline[1] = s:NMiddle
let g:airline#themes#kyotonight#palette.insert.airline[1] = s:IMiddle
let g:airline#themes#kyotonight#palette.replace.airline[1] = s:RMiddle
let g:airline#themes#kyotonight#palette.visual.airline[1] = s:VMiddle
let g:airline#themes#kyotonight#palette.inactive.airline[1] = s:IAMiddle
