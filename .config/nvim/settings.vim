syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=$HOME/nvim/undodir
set undofile
set incsearch

"set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey
               
colorscheme gruvbox
set background=dark
             
" Fix python issues by forcing python3 to load first
if has('python3')
endif                     
            
if executable('rg')
    let g:rg_derive_root='true'
endif              
                                                
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'

let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

"coc config
let g:coc_global_extensions = [
            \'coc-python',
            \'coc-tsserver',
            \'coc-json',
            \'coc-eslint',
            \'coc-css',
            \'coc-snippets',
            \'coc-pairs',
            \'coc-prettier',
\]
