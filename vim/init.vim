set nocompatible              " be iMproved, required
filetype off                  " required
set shell=/bin/bash

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'


Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-latex/vim-latex'
Plugin 'c.vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'petRUShka/vim-opencl'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'morhetz/gruvbox'

call vundle#end()            " required
filetype plugin indent on    " required

let g:python_host_prog = '/usr/bin/python2.7'

let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>

"set tabs and shifts to 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax on
set background=dark
let g:solarized_termcolor=256
colorscheme gruvbox
set laststatus=2
set relativenumber
set number
set nowrap

let g:neocomplete#enable_at_startup = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:airline_powerline_fonts = 1

let g:deoplete#enable_at_startup = 1

set wildmenu
set showcmd
set hlsearch
set ruler

set ignorecase
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntasitc_c_clang_check_post_args = ""
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11'
