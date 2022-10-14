" Copyright (C) 2022-present Wojciech M. Wnuk <laniusone@pm.me>

" Project: Kyoto Night Vim
" Repository: https://github.com/laniusone/kyotonight.vim
" License: MIT

let s:kyotonight_vim_version="0.1.0"
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:kn_blackest   = ["#0f0f14", "NONE"]
let s:kn_bg         = ["#1a1b26", 0]
let s:kn_blacklight = ["#24283b", "NONE"]
let s:kn_grey       = ["#414868", 8]
let s:kn_fg         = ["#a9b1d6", "NONE"]
let s:kn_greylight  = ["#cfc9c2", 7]
let s:kn_cyanlight  = ["#b4f9f8", 15]
let s:kn_teal       = ["#73daca", 14]
let s:kn_bluelight  = ["#7dcfff", 6]
let s:kn_blue       = ["#7aa2f7", 4]
let s:kn_cyan       = ["#2ac3de", 12]
let s:kn_red        = ["#f7768e", 1]
let s:kn_orange     = ["#ff9e64", 11]
let s:kn_yellow     = ["#e0af68", 3]
let s:kn_green      = ["#9ece6a", 2]
let s:kn_magenta    = ["#bb9af7", 5]

let s:p.normal.left = [ [ s:kn_bg, s:kn_bluelight ], [ s:kn_greylight, s:kn_bg ] ]
let s:p.normal.middle = [ [ s:kn_greylight, s:kn_grey ] ]
let s:p.normal.right = [ [ s:kn_greylight, s:kn_bg ], [ s:kn_greylight, s:kn_bg ] ]
let s:p.normal.warning = [ [ s:kn_bg, s:kn_yellow ] ]
let s:p.normal.error = [ [ s:kn_bg, s:kn_red ] ]

let s:p.inactive.left =  [ [ s:kn_bg, s:kn_bluelight ], [ s:kn_greylight, s:kn_bg ] ]
let s:p.inactive.middle = g:kyotonight_uniform_status_lines == 0 ? [ [ s:kn_greylight, s:kn_bg ] ] : [ [ s:kn_greylight, s:kn_grey ] ]
let s:p.inactive.right = [ [ s:kn_greylight, s:kn_bg ], [ s:kn_greylight, s:kn_bg ] ]

let s:p.insert.left = [ [ s:kn_bg, s:kn_cyanlight ], [ s:kn_greylight, s:kn_bg ] ]
let s:p.replace.left = [ [ s:kn_bg, s:kn_yellow ], [ s:kn_greylight, s:kn_bg ] ]
let s:p.visual.left = [ [ s:kn_bg, s:kn_teal ], [ s:kn_greylight, s:kn_bg ] ]

let s:p.tabline.left = [ [ s:kn_greylight, s:kn_grey ] ]
let s:p.tabline.middle = [ [ s:kn_greylight, s:kn_grey ] ]
let s:p.tabline.right = [ [ s:kn_greylight, s:kn_grey ] ]
let s:p.tabline.tabsel = [ [ s:kn_bg, s:kn_bluelight ] ]

let g:lightline#colorscheme#kyotonight#palette = lightline#colorscheme#flatten(s:p)

