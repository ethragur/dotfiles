set shell=/bin/fish

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/effi/dotfiles/vim/deinvim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/effi/dotfiles/vim/deinvim')
call dein#add('Shougo/dein.vim')


call dein#add('vim-latex/vim-latex')
call dein#add('bling/vim-airline')
call dein#add('petRUShka/vim-opencl')
call dein#add('dantler/vim-alternate')
call dein#add('morhetz/gruvbox')
call dein#add('ervandew/supertab')
call dein#add('JesseKPhillips/d.vim')
call dein#add('tikhomirov/vim-glsl')
call dein#add('tpope/vim-sleuth')
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-clang')
call dein#add('Shougo/neoinclude.vim')
"call dein#add('neomake/neomake')
call dein#add('jiangmiao/auto-pairs')
call dein#add('jeetsukumaran/vim-buffergator')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('Yggdroot/indentLine')
call dein#add('sebastianmarkow/deoplete-rust')

call dein#end()

"check on startupp for non installed plugins
if dein#check_install()
  call dein#install()
endif


filetype plugin indent on    " required 
"let g:python_host_prog = '/usr/bin/python2.7'

let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>

"set tabs and shifts to 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4


" color and optical enhancements
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax on
set background=dark
colorscheme gruvbox
set laststatus=2
set relativenumber
set number
set nowrap

"buffer bindings
nnoremap <A-l> :bnext<cr>
nnoremap <A-h> :bprev<cr>
inoremap <A-l> <Esc>:bnext<cr>
inoremap <A-h> <Esc>:bprev<cr>

" delete without yanking
nnoremap x "_x
vnoremap x "_x

" highlights
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set wildmenu
set showcmd
set hlsearch
set hidden
nnoremap <F3> :set hlsearch!<CR>
set ruler

set ignorecase

set splitright

"deoplete
call deoplete#enable()

"depoplete clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#clang#std#cpp = 'c++14'

"deoplete rust
let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/usr/src/rust/src'

"make and run project
nnoremap <F3> :make! <cr>
nnoremap <F4> :make! run <cr>

"indent chars
let g:indentLine_char = '│'

tnoremap <Esc> <C-\><C-n>
"autostart
"
function OpenTermSplit()
    :70vs term://fish
endfunction

"for xclip support
set clipboard=unnamedplus
