call plug#begin('~/.config/nvim/autoload/plugged')

    "Plug 'morhetz/gruvbox'
    Plug 'gruvbox-community/gruvbox'
    "Plug 'tpope/vim-fugitive'
    Plug 'mbbill/undotree'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'prettier/vim-prettier', {'do': 'yarn install'}
    Plug 'sbdchd/neoformat'

    "nvim-lualine
    Plug 'nvim-lualine/lualine.nvim'
    "If you want to have icons in your statusline choose one of these
    Plug 'kyazdani42/nvim-web-devicons'

    "nvim-tree
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua' 

    "Autocomplete
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'

    "Sane Brackets
    Plug 'jiangmiao/auto-pairs'

    "Spnippets
    Plug 'hrsh7th/vim-vsnip'
    Plug 'rafamadriz/friendly-snippets'
   " Plug 'L3MON4D3/LuaSnip'
   " Plug 'saadparwaiz1/cmp_luasnip' 

    "LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'ray-x/lsp_signature.nvim'
    "Plug 'glepnir/lspsaga.nvim'
    Plug 'tami5/lspsaga.nvim'
    Plug 'mfussenegger/nvim-jdtls'

    "Debugging
    Plug 'mfussenegger/nvim-dap'

    "telescope requirements
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope-file-browser.nvim'

    "Ranger
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'

    "Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    "Comments
    Plug 'numToStr/Comment.nvim'

call plug#end()
