execute pathogen#infect()

let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>

syntax on
filetype plugin indent on
set background=dark
let g:solarized_termcolor=256
colorscheme solarized
set laststatus=2
set relativenumber
set nowrap
filetype plugin on

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
