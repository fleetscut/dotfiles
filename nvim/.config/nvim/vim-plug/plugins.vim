call plug#begin('~/.config/nvim/autoload/plugged')

    "Plug 'morhetz/gruvbox'
    Plug 'gruvbox-community/gruvbox'
    "Plug 'jremmen/vim-ripgrep'
    Plug 'tpope/vim-fugitive'
    "Plug 'leafgarland/typescript-vim'
    Plug 'vim-utils/vim-man'
    "Plug 'lyuts/vim-rtags'
    "Plug 'kien/ctrlp.vim'
    " Plug 'git@github.com:Valloric/YouCompleteMe.git'
    Plug 'mbbill/undotree'
"    Plug 'neoclide/coc.nvim', {'branch': 'release'}
"    Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
    Plug 'vim-airline/vim-airline'
    "Plug 'preservim/nerdtree'
    Plug 'dhruvasagar/vim-table-mode'
    "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    "Plug 'junegunn/fzf.vim'
    "Plug 'dense-analytics/ale'
    Plug 'christoomey/vim-tmux-navigator'
    "Plug 'posva/vim-vue'
    Plug 'prettier/vim-prettier'
    "Autocomplete
    Plug 'hrsh7th/nvim-compe'
    "Sane Brackets
    Plug 'jiangmiao/auto-pairs'
    "LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'ray-x/lsp_signature.nvim'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'mfussenegger/nvim-jdtls'

    "Debugging
    Plug 'mfussenegger/nvim-dap'

    "telescope requirements
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()
