call plug#begin('~/.config/nvim/autoload/plugged')

    "Plug 'morhetz/gruvbox'
    Plug 'gruvbox-community/gruvbox'
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
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    "Plug 'dense-analytics/ale'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'posva/vim-vue'
    Plug 'prettier/vim-prettier'

call plug#end()
