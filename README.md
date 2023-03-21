# Kyoto Night NeoVim / Vim theme

<!--toc:start-->
- [Kyoto Night NeoVim / Vim theme](#kyoto-night-neovim-vim-theme)
  - [Screenshots](#screenshots)
    - [Plugins visible in screenshots](#plugins-visible-in-screenshots)
  - [Why another Tokyo Night VIM theme...](#why-another-tokyo-night-vim-theme)
  - [About](#about)
  - [Installation](#installation)
    - [Vim-plug](#vim-plug)
    - [Packer](#packer)
  - [Configuration](#configuration)
    - [General config](#general-config)
    - [Lualine](#lualine)
    - [Lightline](#lightline)
    - [Airline](#airline)
    - [Overrriding colors](#overrriding-colors)
  - [Supported plugins](#supported-plugins)
  - [Extras](#extras)
  - [Ackowledgements](#ackowledgements)
<!--toc:end-->

A dark, elegant, and easy on the eyes Neovim / Vim theme, based on Tokyo
Night color palette, with support for bunch of plugins.

## Screenshots

![](https://imgur.com/9FzWR3h.png)

![](https://imgur.com/wPSCAWb.png)

![](https://imgur.com/WAR6ksS.png)

![](https://imgur.com/BBhep1q.png)

![](https://imgur.com/NMkAXA7.png)

![](https://imgur.com/VWalS2r.png)

### Plugins visible in screenshots

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [glepnir/dashboard-nvim](https://github.com/glepnir/dashboard-nvim)
- [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim)
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
    (last screenshot)
- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
    (screenshots 4 and 5)
- [mhinz/vim-startify](https://github.com/mhinz/vim-startify)
    (screenshot 4)

## Why another Tokyo Night VIM theme...

I'm aware that there already is a [Tokyo Night NeoVim
theme](https://github.com/folke/tokyonight.nvim), but I find it a little
too flashy. So, I decided to make my own, that would be closer to
Enki's SublimeText Theme, and easier for the eyes. Added bonus is that
this theme works in NeoVim as well as in regular Vim.

## About

Colorscheme inspired by [Enki
Theme](https://github.com/enkia/enki-theme) variant Tokyo Night, made
using [Tokyo Night color
pallette](https://github.com/enkia/tokyo-night-vscode-theme#color-palette).
The theme's code is based on [Nord
Theme](https://github.com/arcticicestudio/nord-vim) (because I suck at
Lua and VimScript + Nord's tame color combinations is what I needed, at
least initally).

## Installation

### Vim-plug

```vim
Plug 'voidekh/kyotonight.vim'
```

### Packer

```lua
use 'voidekh/kyotonight.vim'
```

## Configuration

All supported config options are basically ported from Nord Theme, below
is list of them with default values. Make sure these are configured
before calling `colorscheme kyotonight`.

### General config

1.  VimScript

    ```vim
    let g:kyotonight_bold = 1
    let g:kyotonight_underline = 1
    let g:kyotonight_italic = 0
    let g:kyotonight_italic_comments = 0
    let g:kyotonight_uniform_status_lines = 0
    let g:kyotonight_cursor_line_number_background = 0
    let g:kyotonight_uniform_diff_background = 0
    let g:kyotonight_lualine_bold = 1

    colorscheme kyotonight
    ```

2.  Lua

    ```lua
    local g = vim.g

    g.kyotonight_bold = 1
    g.kyotonight_underline = 1
    g.kyotonight_italic = 0
    g.kyotonight_italic_comments = 0
    g.kyotonight_uniform_status_lines = 0
    g.kyotonight_bold_vertical_split_line = 0
    g.kyotonight_cursor_line_number_background = 0
    g.kyotonight_uniform_diff_background = 0
    g.kyotonight_lualine_bold = 1

    vim.cmd[[colorscheme kyotonight]]
    ```

### Lualine

1.  Lua

    ```lua
    require('lualine').setup {
      options = {
        theme = 'kyotonight'
      }
    }
    ```

### Lightline

Normally Lightline theme should be applied automatically if it isn't
set in your configuration already.

1.  VimScript

    ```vim
    let g:lightline = {'colorscheme': 'kyotonight'}
    ```

2.  Lua

    ```lua
    vim.g.lightline = {colorscheme = 'kyotonight'}
    ```

### Airline

As with Lightline, the theme should be applied together with
colorscheme. You might set it manually as well.

1.  VimScript

    ```vim
    let g:airline_theme='kyotonight'
    ```

2.  Lua

    ```lua
    vim.g.airline_theme='kyotonight'
    ```

### Overrriding colors

All of the theme colors can be overriden by setting correct variable.

1.  Examples

    1.  VimScript

        ```vim
        let g:kyotonight#red = ['#fff000', '1'] " hex color, then terminal color number
        ```

    2.  Lua

        ```lua
        vim.g['kyotonight#red'] = {'#fff000', '1'} -- hex color, then terminal color number
        ```

2.  List of color variables

    1.  VimScript

        ```vim
        g:kyotonight#none   
        g:kyotonight#cl     
        g:kyotonight#hl     
        g:kyotonight#black0 
        g:kyotonight#bg     
        g:kyotonight#black1 
        g:kyotonight#grey0  
        g:kyotonight#grey1  
        g:kyotonight#fg     
        g:kyotonight#cream  
        g:kyotonight#cyan1  
        g:kyotonight#teal   
        g:kyotonight#blue1  
        g:kyotonight#blue0  
        g:kyotonight#cyan0  
        g:kyotonight#red    
        g:kyotonight#orange 
        g:kyotonight#yellow 
        g:kyotonight#green  
        g:kyotonight#magenta
        ```

    2.  Lua

        ```lua
        vim.g['kyotonight#none']
        vim.g['kyotonight#cl']
        vim.g['kyotonight#hl']
        vim.g['kyotonight#black0']
        vim.g['kyotonight#bg']
        vim.g['kyotonight#black1']
        vim.g['kyotonight#grey0']
        vim.g['kyotonight#grey1']
        vim.g['kyotonight#fg']
        vim.g['kyotonight#cream']
        vim.g['kyotonight#cyan1']
        vim.g['kyotonight#teal']
        vim.g['kyotonight#blue1']
        vim.g['kyotonight#blue0']
        vim.g['kyotonight#cyan0']
        vim.g['kyotonight#red']
        vim.g['kyotonight#orange']
        vim.g['kyotonight#yellow']
        vim.g['kyotonight#green']
        vim.g['kyotonight#magenta']
        ```

## Supported plugins

- [x] [luukvbaal/nnn.nvim](https://github.com/luukvbaal/nnn.nvim)
- [x] [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [x] [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
- [x] [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
- [x] [glepnir/dashboard-nvim](https://github.com/glepnir/dashboard-nvim)
- [x] [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim)
- [x] [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [x] [w0rp/ale](https://github.com/w0rp/ale)
- [x] [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
- [x] [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [x] [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [x] [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [x] [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [x] [mhinz/vim-signify](https://github.com/mhinz/vim-signify)
- [x] [justinmk/vim-sneak](https://github.com/justinmk/vim-sneak)
- [x] [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [x] [davidhalter/jedi-vim](https://github.com/davidhalter/jedi-vim)
- [x] [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
- [x] [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
- [x] [liuchengxu/vim-clap](https://github.com/liuchengxu/vim-clap)
- [x] [nathanaelkane/vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
- [x] [junegunn/vim-plug](https://github.com/junegunn/vim-plug)
- [x] [kshenoy/vim-signature](https://github.com/kshenoy/vim-signature)
- [x] [mhinz/vim-startify](https://github.com/mhinz/vim-startify)
- [x] [vimwiki/vimwiki](https://github.com/vimwiki/vimwiki)
- [x] [neovimhaskell/haskell-vim](https://github.com/neovimhaskell/haskell-vim)
- [x] [pangloss/vim-javascript](https://github.com/pangloss/vim-javascript)
- [x] [vim-pandoc/vim-pandoc-syntax](https://github.com/vim-pandoc/vim-pandoc-syntax)
- [x] [HerringtonDarkholme/yats.vim](https://github.com/HerringtonDarkholme/yats.vim)
- [x] [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown)
- [x] [StanAngeloff/php.vim](https://github.com/StanAngeloff/php.vim)
- [x] [stephpy/vim-yaml](https://github.com/stephpy/vim-yaml)

## Extras

- [Kitty theme](https://github.com/voidekh/kyotonight.vim/blob/master/extras/kitty/kyotonight.conf)
- For Alacritty or other look into [tokyonight.nvim extras](https://github.com/folke/tokyonight.nvim/tree/main/extras)
- [GTK Theme](https://github.com/voidekh/oomox-arc-kyotonight) to go with this colorscheme (or Folke's)
- [i3 and i3bar theme](https://github.com/voidekh/kyotonight.vim/raw/master/extras/i3/kyotonight)
- [rofi theme](https://github.com/voidekh/kyotonight.vim/raw/master/extras/rofi/KyotoNight.rasi)
- [dunst theme](https://github.com/voidekh/kyotonight.vim/raw/master/extras/dunst/dunstrc)
- [Kvantum theme](https://github.com/voidekh/kyotonight.vim/tree/master/extras/kvantum)
- [i3lock theme](https://github.com/voidekh/kyotonight.vim/tree/master/extras/i3lock-color)
- [Contour terminal theme](https://github.com/voidekh/kyotonight.vim/raw/master/extras/contour/kyotonight.yml)
- [tym terminal](https://github.com/voidekh/kyotonight.vim/raw/master/extras/tym/theme.lua)
- [tmux status line theme](https://github.com/voidekh/kyotonight.vim/raw/master/extras/tmux/tmux.conf)
- [Xfce4 panel theme](https://github.com/voidekh/kyotonight.vim/raw/master/extras/xfce4-panel/gtk.css)
- [Xfce4 terminal theme](https://github.com/voidekh/kyotonight.vim/raw/master/extras/xfce4-terminal/terminalrc)
- Theme also supports lightline, airline and lualine

## Ackowledgements

- [Enki](https://github.com/enkia) for wonderful Tokyo Night theme
- [Folke](https://github.com/folke) for bringing it to NeoVim
- [ArcticIceStudio](https://github.com/arcticicestudio) for Nord Theme for Vim, on which code of this theme is based on
