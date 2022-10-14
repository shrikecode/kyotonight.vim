" Copyright (C) 2022-present Wojciech M. Wnuk <laniusone@pm.me>

" Project: Kyoto Night Vim
" Repository: https://github.com/laniusone/kyotonight.vim
" License: MIT

let s:kyotonight_vim_version="0.1.0"
let g:airline#themes#kyotonight#palette = {}

let s:kn_blackest_gui  = "#0f0f14"
let s:kn_bg_gui  = "#1a1b26"
let s:kn_blacklight_gui  = "#24283b"
let s:kn_grey_gui  = "#414868"
let s:kn_fg_gui  = "#a9b1d6"
let s:kn_greylight_gui  = "#cfc9c2"
let s:kn_cyanlight_gui  = "#b4f9f8"
let s:kn_teal_gui  = "#73daca"
let s:kn_bluelight_gui  = "#7dcfff"
let s:kn_blue_gui  = "#7aa2f7"
let s:kn_cyan_gui = "#2ac3de"
let s:kn_red_gui = "#f7768e"
let s:kn_orange_gui = "#ff9e64"
let s:kn_yellow_gui = "#e0af68"
let s:kn_green_gui = "#9ece6a"
let s:kn_magenta_gui = "#bb9af7"

let s:kn_blackest_term = "NONE"
let s:kn_bg_term = "0"
let s:kn_blacklight_term = "NONE"
let s:kn_fg_term = "NONE"
let s:kn_red_term = "1"
let s:kn_green_term = "2"
let s:kn_yellow_term = "3"
let s:kn_blue_term = "4"
let s:kn_magenta_term = "5"
let s:kn_bluelight_term = "6"
let s:kn_greylight_term = "7"
let s:kn_grey_term = "8"
let s:kn_orange_term = "11"
let s:kn_cyan_term = "12"
let s:kn_teal_term = "14"
let s:kn_cyanlight_term = "15"

let s:NMain = [s:kn_bg_gui, s:kn_bluelight_gui, s:kn_bg_term, s:kn_bluelight_term]
let s:NRight = [s:kn_bg_gui, s:kn_blue_gui, s:kn_bg_term, s:kn_blue_term]
let s:NMiddle = [s:kn_greylight_gui, s:kn_grey_gui, s:kn_greylight_term, s:kn_grey_term]
let s:NWarn = [s:kn_bg_gui, s:kn_yellow_gui, s:kn_grey_term, s:kn_yellow_term]
let s:NError = [s:kn_blackest_gui, s:kn_red_gui, s:kn_bg_term, s:kn_red_term]
let g:airline#themes#kyotonight#palette.normal = airline#themes#generate_color_map(s:NMain, s:NRight, s:NMiddle)
let g:airline#themes#kyotonight#palette.normal.airline_warning = s:NWarn
let g:airline#themes#kyotonight#palette.normal.airline_error = s:NError

let s:IMain = [s:kn_bg_gui, s:kn_green_gui, s:kn_bg_term, s:kn_cyanlight_term]
let s:IRight = [s:kn_bg_gui, s:kn_blue_gui, s:kn_bg_term, s:kn_blue_term]
let s:IMiddle = [s:kn_greylight_gui, s:kn_grey_gui, s:kn_greylight_term, s:kn_grey_term]
let s:IWarn = [s:kn_bg_gui, s:kn_yellow_gui, s:kn_grey_term, s:kn_yellow_term]
let s:IError = [s:kn_blackest_gui, s:kn_red_gui, s:kn_bg_term, s:kn_red_term]
let g:airline#themes#kyotonight#palette.insert = airline#themes#generate_color_map(s:IMain, s:IRight, s:IMiddle)
let g:airline#themes#kyotonight#palette.insert.airline_warning = s:IWarn
let g:airline#themes#kyotonight#palette.insert.airline_error = s:IError

let s:RMain = [s:kn_bg_gui, s:kn_green_gui, s:kn_bg_term, s:kn_green_term]
let s:RRight = [s:kn_bg_gui, s:kn_blue_gui, s:kn_bg_term, s:kn_blue_term]
let s:RMiddle = [s:kn_greylight_gui, s:kn_grey_gui, s:kn_greylight_term, s:kn_grey_term]
let s:RWarn = [s:kn_bg_gui, s:kn_yellow_gui, s:kn_grey_term, s:kn_yellow_term]
let s:RError = [s:kn_blackest_gui, s:kn_red_gui, s:kn_bg_term, s:kn_red_term]
let g:airline#themes#kyotonight#palette.replace = airline#themes#generate_color_map(s:RMain, s:RRight, s:RMiddle)
let g:airline#themes#kyotonight#palette.replace.airline_warning = s:RWarn
let g:airline#themes#kyotonight#palette.replace.airline_error = s:RError

let s:VMain = [s:kn_bg_gui, s:kn_teal_gui, s:kn_bg_term, s:kn_teal_term]
let s:VRight = [s:kn_bg_gui, s:kn_blue_gui, s:kn_bg_term, s:kn_blue_term]
let s:VMiddle = [s:kn_greylight_gui, s:kn_grey_gui, s:kn_greylight_term, s:kn_grey_term]
let s:VWarn = [s:kn_bg_gui, s:kn_yellow_gui, s:kn_grey_term, s:kn_yellow_term]
let s:VError = [s:kn_blackest_gui, s:kn_red_gui, s:kn_bg_term, s:kn_red_term]
let g:airline#themes#kyotonight#palette.visual = airline#themes#generate_color_map(s:VMain, s:VRight, s:VMiddle)
let g:airline#themes#kyotonight#palette.visual.airline_warning = s:VWarn
let g:airline#themes#kyotonight#palette.visual.airline_error = s:VError

let s:IAMain = [s:kn_greylight_gui, s:kn_grey_gui, s:kn_greylight_term, s:kn_grey_term]
let s:IARight = [s:kn_greylight_gui, s:kn_grey_gui, s:kn_greylight_term, s:kn_grey_term]
if g:kyotonight_uniform_status_lines == 0
  let s:IAMiddle = [s:kn_greylight_gui, s:kn_bg_gui, s:kn_greylight_term, s:kn_bg_term]
else
  let s:IAMiddle = [s:kn_greylight_gui, s:kn_grey_gui, s:kn_greylight_term, s:kn_grey_term]
endif
let s:IAWarn = [s:kn_bg_gui, s:kn_yellow_gui, s:kn_grey_term, s:kn_yellow_term]
let s:IAError = [s:kn_blackest_gui, s:kn_red_gui, s:kn_bg_term, s:kn_red_term]
let g:airline#themes#kyotonight#palette.inactive = airline#themes#generate_color_map(s:IAMain, s:IARight, s:IAMiddle)
let g:airline#themes#kyotonight#palette.inactive.airline_warning = s:IAWarn
let g:airline#themes#kyotonight#palette.inactive.airline_error = s:IAError

let g:airline#themes#kyotonight#palette.normal.airline_term = s:NMiddle
let g:airline#themes#kyotonight#palette.insert.airline_term = s:IMiddle
let g:airline#themes#kyotonight#palette.replace.airline_term = s:RMiddle
let g:airline#themes#kyotonight#palette.visual.airline_term = s:VMiddle
let g:airline#themes#kyotonight#palette.inactive.airline_term = s:IAMiddle
