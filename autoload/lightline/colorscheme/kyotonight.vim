" Copyright (C) 2022-present Wojciech M. Wnuk <laniusone@pm.me>

" Project: Kyoto Night Vim
" Repository: https://github.com/sigmavim/kyotonight
" License: MIT

let s:kyotonight_vim_version="1.0.0"
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

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

let s:p.normal.left = [ [ s:black1, s:blue0 ], [ s:blue0, s:black1 ] ]
let s:p.normal.middle = [ [ s:blue0, s:black0] ]
let s:p.normal.right = [ [ s:black1, s:blue0 ], [ s:blue0, s:black1 ] ]
let s:p.normal.warning = [ [ s:yellow, s:black1 ] ]
let s:p.normal.error = [ [ s:red, s:black1 ] ]
let s:p.normal.info = [ [ s:blue1, s:black1 ] ]
let s:p.normal.hint = [ [ s:cyan1, s:black1 ] ]

let s:p.inactive.left =  [ [ s:black1, s:grey1 ], [ s:grey1, s:black1 ] ]
let s:p.inactive.middle = g:kyotonight_uniform_status_lines == 0 ? [ [ s:grey1, s:black0 ] ] : [ [ s:fg, s:black0] ]
let s:p.inactive.right = [ [ s:black1, s:grey1 ], [ s:grey1, s:black1 ] ]

let s:p.insert.left = [ [ s:black1, s:green ], [ s:green, s:black1 ] ]
let s:p.insert.middle = [ [ s:green, s:black0 ] ]
let s:p.insert.right = [ [ s:black1, s:green ], [ s:green, s:black1 ] ]
let s:p.replace.left = [ [ s:black1, s:red ], [ s:red, s:black1 ] ]
let s:p.replace.middle = [ [ s:red, s:black0 ] ]
let s:p.replace.right = [ [ s:black1, s:red ], [ s:red, s:black1 ] ]
let s:p.visual.left = [ [ s:black1, s:magenta ], [ s:magenta, s:black1 ] ]
let s:p.visual.middle = [ [ s:magenta, s:black0 ] ]
let s:p.visual.right = [ [ s:black1, s:magenta ], [ s:magenta, s:black1 ] ]

let s:p.tabline.left = [ [ s:grey1, s:bg] ]
let s:p.tabline.middle = [ [ s:grey1, s:bg] ]
let s:p.tabline.right = [ [ s:grey1, s:bg] ]
let s:p.tabline.tabsel = [ [ s:fg, s:bg ] ]

let g:lightline#colorscheme#kyotonight#palette = lightline#colorscheme#flatten(s:p)

