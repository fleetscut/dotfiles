syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nohlsearch
set hidden
set relativenumber
set nowrap
set noswapfile
set nobackup
set undodir=$HOME/nvim/undodir
set undofile
set incsearch
set scrolloff=8
set termguicolors
set signcolumn=yes
set listchars+=eol:$
set splitbelow
set splitright

"set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey

set background=dark
colorscheme gruvbox
set termguicolors
hi Normal guibg=NONE ctermbg=NONE

"hi NonText guibg=NONE ctermbg=NONE
" Fix python issues by forcing python3 to load first

if has('python3')
endif

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ycm_path_to_python_interpreter = '/usr/bin/python3'

let mapleader = " "
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25

