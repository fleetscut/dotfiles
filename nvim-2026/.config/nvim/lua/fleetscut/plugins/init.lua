vim.pack.add({
	-- Deps
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/rafamadriz/friendly-snippets",

	--- Treesitter
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
	-- "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
	-- "https://github.com/nvim-treesitter/playground",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/drybalka/tree-climber.nvim",

	"https://github.com/nvim-tree/nvim-web-devicons",

	"https://github.com/mbbill/undotree",
	--
	-- Telescope
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope-file-browser.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/nvim-telescope/telescope-symbols.nvim",
	"https://github.com/benfowler/telescope-luasnip.nvim",

	"https://github.com/hedyhli/outline.nvim",

	-- mini.nvim
	"https://github.com/nvim-mini/mini.nvim",

	-- blink.cmp
	"https://github.com/onsails/lspkind.nvim",
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",

	-- lsp
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	"https://github.com/mfussenegger/nvim-lint.git",
	"https://github.com/stevearc/conform.nvim.git",

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

	"https://github.com/vieitesss/miniharp.nvim",

	"https://github.com/nvim-lualine/lualine.nvim",

	"https://github.com/folke/lazydev.nvim",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",

	"https://github.com/HiPhish/rainbow-delimiters.nvim",

	"https://github.com/Kicamon/markdown-table-mode.nvim",
	"https://github.com/alexghergh/nvim-tmux-navigation",

	"https://github.com/ray-x/lsp_signature.nvim",

	"https://github.com/EskelinenAntti/omarchy-theme-loader.nvim",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/bjarneo/aether.nvim",
	"https://github.com/bjarneo/hackerman.nvim",
})

require("fleetscut.plugins.telescope")
require("fleetscut.plugins.outline")
require("fleetscut.plugins.lsp")
require("fleetscut.plugins.treesitter")
require("fleetscut.plugins.noice")
require("fleetscut.plugins.blink")
require("fleetscut.plugins.mini")
require("fleetscut.plugins.colorizer")
require("fleetscut.plugins.copilot")
require("fleetscut.plugins.dadbod")
require("fleetscut.plugins.gitsigns")
require("fleetscut.plugins.harpoon")
require("fleetscut.plugins.lualine")
require("fleetscut.plugins.notes")
require("fleetscut.plugins.rainbow-delimiters")
require("fleetscut.plugins.tablemode")
require("fleetscut.plugins.undotree")
require("fleetscut.plugins.autotag")
