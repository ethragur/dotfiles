set shell=/bin/zsh

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax on

" Vim settings
"
set background=dark
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set laststatus=2
set relativenumber
set number
set nowrap
set conceallevel=0 
set wildmenu
set wildmode=list:longest,full
set showcmd
set hidden
set ignorecase
set clipboard=unnamedplus
set shortmess+=c
set inccommand=nosplit
set encoding=utf-8
set ttimeout ttimeoutlen=5
set showtabline=2


" Keybinds
" 
let mapleader   = "\<Space>"
let g:mapleader = "\<Space>"
nmap <leader>w :w!<cr>
" buffer bindings
nnoremap <A-l> :bnext<cr>
nnoremap <A-h> :bprev<cr>
inoremap <A-l> <Esc>:bnext<cr>
inoremap <A-h> <Esc>:bprev<cr>
" window bindings
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <C-N> :vertical resize -10<cr>
nnoremap <C-M> :vertical resize +10<cr>
" delete without yanking
nnoremap x "_x
vnoremap x "_x

" Filetype specific options
"
au BufNewFile,BufRead /*.rasi setf css
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml 
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Install Vim Plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')
" -------------------- VISUAL ----------------------- "
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/rainbow_parentheses.vim'
"{
    let g:rainbow_active = 1
    autocmd VimEnter * RainbowParentheses
"}

Plug 'gko/vim-coloresque'
Plug 'dylanaraps/wal.vim'

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" lightline
let g:lightline = {
  \ 'colorscheme': 'wal',
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

" ----------------- ENHANCE ------------------------ "
"
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
"{
    nmap <leader>gd :Gdiff<cr>
    nmap <leader>gs :Gstatus<cr>
"}

Plug 'junegunn/fzf', { 'dir': '$HOME/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"{
    nnoremap <leader><space> :FZF<CR>
    nnoremap <leader>h :History<CR>
    nnoremap <leader>gc :Commits<CR>
    nnoremap <leader>n :Find 
    nnoremap <leader>s *:Find <C-r>/<BS><BS><C-Left><Del><Del><CR>
    " let $FZF_DEFAULT_COMMAND = 'ag -g "" --ignore=\*.o'
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow -g "!.git/*" -g "!*.o" --no-ignore-parent'
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow -g "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
"}

Plug 'sbdchd/neoformat'
"{
    vmap <leader>f :Neoformat<CR>
    nmap <leader>f :Neoformat<CR>
"}

Plug 'vim-syntastic/syntastic'

Plug 'neoclide/coc.nvim', {'do': 'npm install --frozen-lockfile'}
"{
    " Extensions which are installed when missing on server start
    let g:coc_global_extensions = [
        \ 'coc-css',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-omnisharp',
        \ 'coc-rust-analyzer',
        \ 'coc-phpls',
        \ 'coc-sh',
        \ 'coc-go',
        \ 'coc-tslint-plugin',
        \ 'coc-tsserver',
        \ 'coc-vetur',
        \ 'coc-yaml',
    \]
    " Smaller updatetime for CursorHold & CursorHoldI
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " always show signcolumns
    set signcolumn=yes

     " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <C-space> coc#refresh()

    " Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[c` and `]c` for navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> <leader>tt <Plug>(coc-definition)
    nmap <silent> <leader>td <Plug>(coc-type-definition)
    nmap <silent> <leader>ti <Plug>(coc-implementation)
    nmap <silent> <leader>tr <Plug>(coc-references)

    " Use K for show documentation in preview window
    nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if &filetype == 'vim'
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)
    " Fix autofix problem of current line
    nmap <leader>cf  <Plug>(coc-fix-current)

    nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
    nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
    nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
    nnoremap <silent> <leader>cn  :<C-u>CocNext<cr>
    nnoremap <silent> <leader>cp  :<C-u>CocPrev<cr>

    " Remap for format selected region
    " use vim-autoformat for this still (probably change in the future)
    " vmap <leader>f  <Plug>(coc-format-selected)
    " nmap <leader>f  <Plug>(coc-format-selected)

    " mapping for coc-snippets

    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)
"}


" ------------------ FILETYPES ---------------------- "
Plug 'cespare/vim-toml', { 'for': 'toml'}
Plug 'JulesWang/css.vim', { 'for': ['vue.html.javascript.css', 'vue', 'css', 'scss'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['vue.html.javascript.css', 'vue', 'css', 'scss'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'vue.html.javascript.css', 'vue'] }
Plug 'petRUShka/vim-opencl', {'for' : 'cl'}
Plug 'tikhomirov/vim-glsl', { 'for' : 'glsl' }
Plug 'posva/vim-vue', { 'for': ['vue.html.javascript.css', 'vue'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'vue'] }
Plug 'othree/html5.vim', { 'for': ['htmldjango', 'html', 'vue.html.javascript.css', 'vue'] }
Plug 'ron-rs/ron.vim'
Plug 'stephpy/vim-yaml'
Plug 'chase/vim-ansible-yaml'
Plug 'elzr/vim-json', { 'for': 'json' }
"{
    set conceallevel=0
"}
call plug#end()

    set conceallevel=0
colorscheme wal
filetype plugin indent on    " required
