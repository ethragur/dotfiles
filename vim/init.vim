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
call dein#add('rust-lang/rust.vim', {'on_ft' : [ 'rs']})
call dein#add('sebastianmarkow/deoplete-rust', {'on_ft' : [ 'rs']})
call dein#add('zchee/deoplete-clang', {'on_ft' : [ 'c', 'h', 'cpp', 'hpp', 'cxx']})
call dein#add('dantler/vim-alternate', {'on_ft' : [ 'c', 'h', 'cpp', 'hpp', 'cxx']})
call dein#add('zchee/deoplete-go', {'build': 'make'}, { 'on_ft' : 'go' })
call dein#add('petRUShka/vim-opencl', {'on_ft' : 'cl'})
call dein#add('tikhomirov/vim-glsl', { 'on_ft' : 'glsl' })
call dein#add('Shougo/neoinclude.vim')
call dein#add('Yggdroot/indentLine')
call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0 })
call dein#add('junegunn/fzf.vim')
call dein#add('luochen1990/rainbow')
call dein#add('Chiel92/vim-autoformat')
call dein#add('vim-syntastic/syntastic')
call dein#add('posva/vim-vue', { 'on_ft' : 'vue' } )
call dein#add('donRaphaco/neotex', { 'on_ft': 'tex' } )
call dein#add('arcticicestudio/nord-vim')

call dein#end()

"check on startupp for non installed plugins
if dein#check_install()
  call dein#install()
endif


filetype plugin on    " required
"let g:python_host_prog = '/usr/bin/python2.7'

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
nmap <leader>w :w!<cr>

"set tabs and shifts to 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4


" color and optical enhancements
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax on
set termguicolors
set laststatus=2
set relativenumber
set number
colorscheme nord
set nowrap
set background=dark
let &t_ut=''
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

"" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='nord'

"let g:lightline = { 'colorscheme': 'nord', }

set wildmenu
set showcmd
set hlsearch
set hidden
set ruler

set ignorecase


"deoplete
let g:deoplete#enable_at_startup = 1

let g:SuperTabDefaultCompletionType = "<c-n>"

"depoplete clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#clang#std#cpp = 'c++14'

"deoplete rust
let g:deoplete#sources#rust#racer_binary='/home/effi/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/effi/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

"depoplete go
let g:deoplete#sources#go#gocode_binary = '/home/effi/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
set completeopt -=preview

" Plugin key-mappings.

" For conceal markers.
if has('conceal')
  set conceallevel=0 concealcursor=niv
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
function OpenTermSplit()
  set splitright
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
let g:nord_comment_brightness = 20
"let g:nord_uniform_diff_background = 1

set background=dark

" FZF
let g:fzf_layout = { 'down': '~32%' }
nnoremap <leader><space> :FZF<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>n :Find 
nnoremap <leader>fw *:Find <C-r>/<BS><BS><C-Left><Del><Del><CR>
" let $FZF_DEFAULT_COMMAND= 'ag -g "" --ignore=\*.o'
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!.git/*" -g "!*.o"'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow -g "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
