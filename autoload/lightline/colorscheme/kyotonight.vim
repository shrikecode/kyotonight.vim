" Copyright (C) 2022-present Wojciech M. Wnuk <laniusone@pm.me>

" Project: Kyoto Night Vim
" Repository: https://github.com/laniusone/kyotonight.vim
" License: MIT

let s:kyotonight_vim_version="0.2.2"
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

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

let s:p.normal.left = [ [ s:bg, s:blue1 ], [ s:grey1, s:bg ] ]
let s:p.normal.middle = [ [ s:grey1, s:grey0] ]
let s:p.normal.right = [ [ s:grey1, s:bg ], [ s:grey1, s:bg ] ]
let s:p.normal.warning = [ [ s:bg, s:yellow ] ]
let s:p.normal.error = [ [ s:bg, s:red ] ]

let s:p.inactive.left =  [ [ s:bg, s:blue1 ], [ s:grey1, s:bg ] ]
let s:p.inactive.middle = g:kyotonight_uniform_status_lines == 0 ? [ [ s:grey1, s:bg ] ] : [ [ s:grey1, s:grey0] ]
let s:p.inactive.right = [ [ s:grey1, s:bg ], [ s:grey1, s:bg ] ]

let s:p.insert.left = [ [ s:bg, s:cyan1 ], [ s:grey1, s:bg ] ]
let s:p.replace.left = [ [ s:bg, s:yellow ], [ s:grey1, s:bg ] ]
let s:p.visual.left = [ [ s:bg, s:teal ], [ s:grey1, s:bg ] ]

let s:p.tabline.left = [ [ s:grey1, s:grey0] ]
let s:p.tabline.middle = [ [ s:grey1, s:grey0] ]
let s:p.tabline.right = [ [ s:grey1, s:grey0] ]
let s:p.tabline.tabsel = [ [ s:bg, s:blue1 ] ]

let g:lightline#colorscheme#kyotonight#palette = lightline#colorscheme#flatten(s:p)

