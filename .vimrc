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
set undodir=~/.vim/undodir
set undofile
set incsearch

"set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
" Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'dhruvasagar/vim-table-mode'

call plug#end()

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

" nnoremap <leader>h :wincmd h<CR>
" nnoremap <leader>j :wincmd j<CR>
" nnoremap <leader>k :wincmd k<CR>
" nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
" nnoremap <leader>pv :wincmd v<bar> :EX <bar> :vertical resize 30<CR>
" nnoremap <leader> ps :Rg<SPACE>
" nnoremap <silent> <leader>+ :vertical resize +5<CR>
" nnoremap <silent> <leader>- :vertical resize -5<CR>
"
" YCM
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gd :TcmCompleter FixIt<CR>

"Tabs
nnoremap <leader>n <esc>:tabprevious<CR>
nnoremap <leader>m <esc>:tabnext<CR>

"Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

"Nerdtree
nnoremap <silent><leader>b :NERDTreeToggle<CR>

"Table Mode
nnoremap <leader>t :TableModeToggle<CR>
