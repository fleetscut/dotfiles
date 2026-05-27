vim.pack.add({
    -- Deps
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/rafamadriz/friendly-snippets',

    --- Treesitter
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-context',
	"https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
	-- "https://github.com/nvim-treesitter/playground",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/drybalka/tree-climber.nvim",

    'https://github.com/nvim-tree/nvim-web-devicons',

    -- mini.nvim
    'https://github.com/nvim-mini/mini.nvim',


    -- blink.cmp
    'saghen/blink.lib',
    'saghen/blink.cmp',

    -- lsp
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    'https://github.com/mfussenegger/nvim-lint.git',
    'https://github.com/stevearc/conform.nvim.git',

    -- Telescope
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    'https://github.com/nvim-telescope/telescope-file-browser.nvim',
	'https://github.com/nvim-telescope/telescope-ui-select.nvim',
	'https://github.com/nvim-telescope/telescope-symbols.nvim',
	'https://github.com/benfowler/telescope-luasnip.nvim',

    "https://github.com/catgoose/nvim-colorizer.lua",

    "https://github.com/zbirenbaum/copilot.lua",

	"https://github.com/tpope/vim-dadbod",
    "https://github.com/kristijanhusak/vim-dadbod-ui",
	"https://github.com/kristijanhusak/vim-dadbod-completion",

    -- noice
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/rcarriga/nvim-notify",
    "https://github.com/folke/noice.nvim",

    "https://github.com/tpope/vim-fugitive",

	"https://github.com/lewis6991/gitsigns.nvim",

    'https://github.com/vieitesss/miniharp.nvim',

    'https://github.com/nvim-lualine/lualine.nvim',

    'https://github.com/folke/lazydev.nvim',
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',

    'https://github.com/HiPhish/rainbow-delimiters.nvim',

    "https://github.com/hedyhli/outline.nvim",

    "https://github.com/Kicamon/markdown-table-mode.nvim",
    "https://github.com/alexghergh/nvim-tmux-navigation",
})


require('fleetscut.pack.lsp')
require('fleetscut.pack.treesitter')
-- require('fleetscut.pack.noice')
require('fleetscut.pack.blink')
require('fleetscut.pack.mini')
require('fleetscut.pack.telescope')
require('fleetscut.pack.colorizer')
require('fleetscut.pack.copilot')
require('fleetscut.pack.dadbod')
require('fleetscut.pack.gitsigns')
require('fleetscut.pack.harpoon')
require('fleetscut.pack.lualine')
require('fleetscut.pack.notes')
require('fleetscut.pack.rainbow-delimiters')
require('fleetscut.pack.outline')
require('fleetscut.pack.tablemode')
