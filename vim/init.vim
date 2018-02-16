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


call dein#add('bling/vim-airline')
call dein#add('morhetz/gruvbox')
call dein#add('ervandew/supertab')
call dein#add('tpope/vim-sleuth')
call dein#add('tpope/vim-commentary')
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-clang', {'on_ft' : [ 'c', 'h', 'cpp', 'hpp', 'cxx']})
call dein#add('dantler/vim-alternate', {'on_ft' : [ 'c', 'h', 'cpp', 'hpp', 'cxx']})
call dein#add('rust-lang/rust.vim')
call dein#add('sebastianmarkow/deoplete-rust')
call dein#add('zchee/deoplete-go', {'build': 'make'}, { 'on_ft' : 'go' })
call dein#add('petRUShka/vim-opencl', {'on_ft' : 'cl'})
call dein#add('tikhomirov/vim-glsl', { 'on_ft' : 'glsl' })
call dein#add('Shougo/neoinclude.vim')
call dein#add('Yggdroot/indentLine')
call dein#add('junegunn/fzf.vim')
call dein#add('luochen1990/rainbow')
call dein#add('Chiel92/vim-autoformat')
call dein#add('vim-syntastic/syntastic')
call dein#add('dag/vim-fish', { 'on_ft' : 'fish' } )
call dein#add('posva/vim-vue', { 'on_ft' : 'vue' } )
call dein#add('donRaphaco/neotex', { 'on_ft': 'tex' } )

call dein#end()

"check on startupp for non installed plugins
if dein#check_install()
  call dein#install()
endif


filetype plugin on    " required
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
set termguicolors
colorscheme gruvbox
set laststatus=2
set relativenumber
set number
set nowrap
set background=dark
hi Normal guibg=NONE ctermbg=NONE

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
set ruler

set ignorecase


"deoplete
let g:deoplete#enable_at_startup = 1

"depoplete clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#clang#std#cpp = 'c++14'

"deoplete rust
let g:deoplete#sources#rust#racer_binary='~/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/'

"depoplete go
let g:deoplete#sources#go#gocode_binary = '/home/effi/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
set completeopt -=preview

" Plugin key-mappings.

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"other addons
let g:rainbow_active = 1
"indent chars
let g:indentLine_char = '│'


map <A-k> :A <CR>
map <A-j> :IH <CR>
"make and run project
nnoremap <F3> :make! <cr>
nnoremap <F4> :make! run <cr>

noremap <F5> :Autoformat<CR>

"autostart
"
set splitright
function OpenTermSplit()
  :70vs term://fish
endfunction

"for xclip support
set clipboard=unnamedplus

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" asm checkers are shitty
let g:syntastic_asm_checkers=['']
