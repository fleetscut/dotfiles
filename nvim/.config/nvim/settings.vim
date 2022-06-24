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

set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey

" set background=dark
" colorscheme gruvbox
let g:tokyonight_style = "night"
colorscheme tokyonight
set termguicolors
" hi Normal guibg=NONE ctermbg=NONE

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

"Treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=20


let g:neoformat_java_clangcustom = {
            \ 'exe': 'clang-format',
            \ 'args': ['-assume-filename=' . expand('%:t'), '-style="{IndentWidth: 4, ColumnLimit: 0}"'],
            \ 'stdin': 1,
            \ }

let g:neoformat_javascript_jsbeautify_custom = {
            \ 'exe': 'js-beautify',
            \ 'args': ['--indent-size ' .shiftwidth(), '--brace-style collapse,preserve-inline', '--break-chained-methods'],
            \ 'stdin': 1,
            \ 'try_node_exe': 1,
            \ }

let g:neoformat_enabled_java = ['clangcustom']
let g:neoformat_enabled_javascript = ['jsbeautify_custom']

augroup fmt
  autocmd!
  autocmd BufWritePre *.java Neoformat
  autocmd BufWritePre *.js Neoformat
augroup END

au BufNewFile,BufRead *.ejs set filetype=html
