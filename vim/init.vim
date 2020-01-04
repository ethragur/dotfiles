set shell=/bin/zsh

call plug#begin('~/.local/share/nvim/plugged')
" Required:
"
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'ervandew/supertab'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'rust-lang/rust.vim', {'for' : [ 'rs']}
Plug 'racer-rust/vim-racer', {'for' : [ 'rs']}
Plug 'OmniSharp/omnisharp-vim', {'for' : [ 'cs']}
Plug 'petRUShka/vim-opencl', {'for' : 'cl'}
Plug 'tikhomirov/vim-glsl', { 'for' : 'glsl' }
Plug 'peterhoeg/vim-qml', { 'for' : 'qml' }
Plug 'posva/vim-vue', { 'for' : 'vue' } 
Plug 'donRaphaco/neotex', { 'for': 'tex' } 
Plug 'chrisbra/NrrwRgn'
Plug 'Shougo/neoinclude.vim'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'tommcdo/vim-lion'
Plug 'vim-syntastic/syntastic'
Plug 'leafgarland/typescript-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'dylanaraps/wal.vim'

call plug#end()

filetype plugin on    " required
"let g:python_host_prog = '/usr/bin/python2.7'

let mapleader   = "\<Space>"
let g:mapleader = "\<Space>"
nmap <leader>w :w!<cr>

"set tabs and shifts to 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set showtabline=2


" color and optical enhancements
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax on
set laststatus=2
set relativenumber
set number
colorscheme wal
hi Normal guibg=NONE ctermbg=NONE
au ColorScheme * hi Normal ctermbg=none guibg=none
set nowrap
set background=dark
set conceallevel=0 
let &t_ut=''
set iskeyword-=_

"buffer bindings
nnoremap <A-l> :bnext<cr>
nnoremap <A-h> :bprev<cr>
inoremap <A-l> <Esc>:bnext<cr>
inoremap <A-h> <Esc>:bprev<cr>

"window bindings
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
" delete without yanking
nnoremap x "_x
vnoremap x "_x

au BufNewFile,BufRead /*.rasi setf css

" highlights
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_structs           = 1
let g:go_highlight_operators         = 1
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
let g:racer_cmd = "/home/effi/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
"let g:deoplete#sources#rust#racer_binary='/home/effi/.cargo/bin/racer'
"let g:deoplete#sources#rust#rust_source_path='/home/effi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

"depoplete go
let g:deoplete#sources#go#gocode_binary = '/home/effi/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
set completeopt -=preview

"deoplete php
"let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
"let g:deoplete#ignore_sources.php = ['omni']

" Plugin key-mappings.

"other addons
let g:rainbow_active  = 1
"indent chars
let g:indentLine_char = '│'
let g:indentLine_setConceal = 0


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
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
" asm checkers are shitty
let g:syntastic_asm_checkers             =['']
"let g:nord_uniform_diff_background      = 1

set background=dark

" FZF
let g:fzf_layout          = { 'down': '~32%' }
nnoremap <leader><space> :Files<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>n :Find 
nnoremap <leader>fw *:Find <C-r>/<BS><BS><C-Left><Del><Del><CR>
" let $FZF_DEFAULT_COMMAND= 'ag -g "" --ignore=\*.o'
let $FZF_DEFAULT_COMMAND  ='rg --files --hidden --follow -g "!.git/*" -g "!*.o"'

let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim

" TESTING GROUND "
set inccommand=nosplit


" lightline
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \     [ 'blame' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \ },
  \ 'tabline': {
  \    'left': [['buffers']], 'right': [['close']]
  \ },
  \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
  \ 'component_type': {'buffers': 'tabsel'}
\ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

