" Copyright (C) 2022-present Wojciech M. Wnuk <laniusone@pm.me>

" Project: Kyoto Night Vim
" Repository: https://github.com/laniusone/kyotonight.vim
" License: MIT

let s:kyotonight_vim_version="0.0.1"
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:kyotonight0  = ["#1a1b26", "NONE"]
let s:kyotonight1  = ["#24283b", 0]
let s:kyotonight2  = ["#414868", "NONE"]
let s:kyotonight3  = ["#565f89", 8]
let s:kyotonight4  = ["#a9b1d6", "NONE"]
let s:kyotonight5  = ["#cfc9c2", 7]
let s:kyotonight6  = ["#d5d6db", 15]
let s:kyotonight7  = ["#73daca", 14]
let s:kyotonight8  = ["#7dcfff", 6]
let s:kyotonight9  = ["#7aa2f7", 4]
let s:kyotonight10 = ["#b4f9f8", 12]
let s:kyotonight11 = ["#f7768e", 1]
let s:kyotonight12 = ["#ff9e64", 11]
let s:kyotonight13 = ["#e0af68", 3]
let s:kyotonight14 = ["#9ece6a", 2]
let s:kyotonight15 = ["#bb9af7", 5]

let s:p.normal.left = [ [ s:kyotonight1, s:kyotonight8 ], [ s:kyotonight5, s:kyotonight1 ] ]
let s:p.normal.middle = [ [ s:kyotonight5, s:kyotonight3 ] ]
let s:p.normal.right = [ [ s:kyotonight5, s:kyotonight1 ], [ s:kyotonight5, s:kyotonight1 ] ]
let s:p.normal.warning = [ [ s:kyotonight1, s:kyotonight13 ] ]
let s:p.normal.error = [ [ s:kyotonight1, s:kyotonight11 ] ]

let s:p.inactive.left =  [ [ s:kyotonight1, s:kyotonight8 ], [ s:kyotonight5, s:kyotonight1 ] ]
let s:p.inactive.middle = g:kyotonight_uniform_status_lines == 0 ? [ [ s:kyotonight5, s:kyotonight1 ] ] : [ [ s:kyotonight5, s:kyotonight3 ] ]
let s:p.inactive.right = [ [ s:kyotonight5, s:kyotonight1 ], [ s:kyotonight5, s:kyotonight1 ] ]

let s:p.insert.left = [ [ s:kyotonight1, s:kyotonight6 ], [ s:kyotonight5, s:kyotonight1 ] ]
let s:p.replace.left = [ [ s:kyotonight1, s:kyotonight13 ], [ s:kyotonight5, s:kyotonight1 ] ]
let s:p.visual.left = [ [ s:kyotonight1, s:kyotonight7 ], [ s:kyotonight5, s:kyotonight1 ] ]

let s:p.tabline.left = [ [ s:kyotonight5, s:kyotonight3 ] ]
let s:p.tabline.middle = [ [ s:kyotonight5, s:kyotonight3 ] ]
let s:p.tabline.right = [ [ s:kyotonight5, s:kyotonight3 ] ]
let s:p.tabline.tabsel = [ [ s:kyotonight1, s:kyotonight8 ] ]

let g:lightline#colorscheme#kyotonight#palette = lightline#colorscheme#flatten(s:p)

