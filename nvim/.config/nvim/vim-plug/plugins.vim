call plug#begin('~/.config/nvim/autoload/plugged')

    "Plug 'morhetz/gruvbox'
    Plug 'gruvbox-community/gruvbox'
    Plug 'tpope/vim-fugitive'
    Plug 'mbbill/undotree'
    Plug 'vim-airline/vim-airline'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'prettier/vim-prettier', {'do': 'yarn install'}
    Plug 'sbdchd/neoformat'
    
    "Autocomplete
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'

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

    "Ranger
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'

    "Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    "Comments
    Plug 'numToStr/Comment.nvim'

call plug#end()
