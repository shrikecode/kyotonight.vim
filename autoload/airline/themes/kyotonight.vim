" Copyright (C) 2022-present Wojciech M. Wnuk <laniusone@pm.me>

" Project: Kyoto Night Vim
" Repository: https://github.com/sigmavim/kyotonight
" License: MIT

let s:kyotonight_vim_version="1.0.0"
let g:airline#themes#kyotonight#palette = {}

let s:none        = get(g:, "kyotonight#none", ["NONE", "NONE"])
let s:cl          = get(g:, "kyotonight#cl", ["#292e42", "NONE"])
let s:hl          = get(g:, "kyotonight#hl", ["#33467c", "7"])
let s:black0      = get(g:, "kyotonight#black0", ["#0f0f14", "NONE"])
let s:bg          = get(g:, "kyotonight#bg", ["#1a1b26", "0"])
let s:black1      = get(g:, "kyotonight#black1", ["#24283b", "8"])
let s:grey0       = get(g:, "kyotonight#grey0", ["#414868", "7"])
let s:grey1       = get(g:, "kyotonight#grey1", ["#565f89", "15"])
let s:fg          = get(g:, "kyotonight#fg", ["#a9b1d6", "NONE"])
let s:cream       = get(g:, "kyotonight#cream", ["#cfc9c2", "15"])
let s:cyan1       = get(g:, "kyotonight#cyan1", ["#b4f9f8", "14"])
let s:teal        = get(g:, "kyotonight#teal", ["#73daca", "6"])
let s:blue1       = get(g:, "kyotonight#blue1", ["#7dcfff", "12"])
let s:blue0       = get(g:, "kyotonight#blue0", ["#7aa2f7", "4"])
let s:cyan0       = get(g:, "kyotonight#cyan0", ["#2ac3de", "6"])
let s:red         = get(g:, "kyotonight#red", ["#f7768e", "1"])
let s:orange      = get(g:, "kyotonight#orange", ["#ff9e64", "3"])
let s:yellow      = get(g:, "kyotonight#yellow", ["#e0af68", "11"])
let s:green       = get(g:, "kyotonight#green", ["#9ece6a", "2"])
let s:magenta     = get(g:, "kyotonight#magenta", ["#bb9af7", "5"])

let s:NMain = [s:black1[0], s:blue0[0], s:black1[1], s:blue0[1]]
let s:NRight = [s:blue0[0], s:black1[0], s:blue0[1], s:black1[1]]
let s:NMiddle = [s:fg[0], s:black0[0], s:fg[1], s:black0[1]]
let s:NWarn = [s:black1[0], s:cyan1[0], s:black1[1], s:cyan1[1]]
let s:NError = [s:black1[0], s:red[0], s:black1[1], s:red[1]]
let g:airline#themes#kyotonight#palette.normal = airline#themes#generate_color_map(s:NMain, s:NRight, s:NMiddle)
let g:airline#themes#kyotonight#palette.normal.airline_warning = s:NWarn
let g:airline#themes#kyotonight#palette.normal.airline_error = s:NError

let s:IMain = [s:black1[0], s:green[0], s:black1[1], s:green[1]]
let s:IRight = [s:green[0], s:black1[0], s:green[1], s:black1[1]]
let s:IMiddle = [s:fg[0], s:black0[0], s:fg[1], s:black0[1]]
let s:IWarn = [s:black1[0], s:cyan1[0], s:black1[1], s:cyan1[1]]
let s:IError = [s:black1[0], s:red[0], s:black1[1], s:red[1]]
let g:airline#themes#kyotonight#palette.insert = airline#themes#generate_color_map(s:IMain, s:IRight, s:IMiddle)
let g:airline#themes#kyotonight#palette.insert.airline_warning = s:IWarn
let g:airline#themes#kyotonight#palette.insert.airline_error = s:IError

let s:RMain = [s:black1[0], s:red[0], s:black1[1], s:red[1]]
let s:RRight = [s:red[0], s:black1[0], s:red[1], s:black1[1]]
let s:RMiddle = [s:fg[0], s:black0[0], s:fg[1], s:black0[1]]
let s:RWarn = [s:black1[0], s:cyan1[0], s:black1[1], s:cyan1[1]]
let s:RError = [s:black1[0], s:red[0], s:black1[1], s:red[1]]
let g:airline#themes#kyotonight#palette.replace = airline#themes#generate_color_map(s:RMain, s:RRight, s:RMiddle)
let g:airline#themes#kyotonight#palette.replace.airline_warning = s:RWarn
let g:airline#themes#kyotonight#palette.replace.airline_error = s:RError

let s:VMain = [s:black1[0], s:magenta[0], s:black1[1], s:magenta[1]]
let s:VRight = [s:magenta[0], s:black1[0], s:magenta[1], s:black1[1]]
let s:VMiddle = [s:fg[0], s:black0[0], s:fg[1], s:black0[1]]
let s:VWarn = [s:black1[0], s:cyan1[0], s:black1[1], s:cyan1[1]]
let s:VError = [s:black1[0], s:red[0], s:black1[1], s:red[1]]
let g:airline#themes#kyotonight#palette.visual = airline#themes#generate_color_map(s:VMain, s:VRight, s:VMiddle)
let g:airline#themes#kyotonight#palette.visual.airline_warning = s:VWarn
let g:airline#themes#kyotonight#palette.visual.airline_error = s:VError

let s:IAMain = [s:fg[0], s:black1[0], s:fg[1], s:black1[1]]
let s:IARight = [s:fg[0], s:black1[0], s:fg[1], s:black1[1]]
if g:kyotonight_uniform_status_lines == 0
  let s:IAMiddle = [s:fg[0], s:black1[0], s:fg[1], s:black1[1]]
else
  let s:IAMiddle = [s:fg[0], s:black1[0], s:fg[1], s:black1[1]]
endif
let s:IAWarn = [s:black1[0], s:cyan1[0], s:black1[1], s:cyan1[1]]
let s:IAError = [s:black1[0], s:red[0], s:black1[1], s:red[1]]
let g:airline#themes#kyotonight#palette.inactive = airline#themes#generate_color_map(s:IAMain, s:IARight, s:IAMiddle)
let g:airline#themes#kyotonight#palette.inactive.airline_warning = s:IAWarn
let g:airline#themes#kyotonight#palette.inactive.airline_error = s:IAError

let g:airline#themes#kyotonight#palette.normal.airline_term = s:NMiddle
let g:airline#themes#kyotonight#palette.insert.airline_term = s:IMiddle
let g:airline#themes#kyotonight#palette.replace.airline_term = s:RMiddle
let g:airline#themes#kyotonight#palette.visual.airline_term = s:VMiddle
let g:airline#themes#kyotonight#palette.inactive.airline_term = s:IAMiddle
