local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

--vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Coconut Oil
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use("nvim-telescope/telescope-file-browser.nvim")
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use("nvim-telescope/telescope-symbols.nvim")

	-- Theme
	-- use("folke/tokyonight.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("onsails/lspkind-nvim")
	use({ "rose-pine/neovim", as = "rose-pine" })

	-- Line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- LSP
	use("neovim/nvim-lspconfig")
	-- use("ray-x/lsp_signature.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	-- use("nvim-lua/lsp_extensions.nvim")

	-- DAP
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("mfussenegger/nvim-dap-python")
	use("theHamsta/nvim-dap-virtual-text")

	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	-- use("p00f/nvim-ts-rainbow")
	use("HiPhish/nvim-ts-rainbow2")
	use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")
	use("drybalka/tree-climber.nvim")

	-- Completion
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	--use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp-signature-help")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	--use('jiangmiao/auto-pairs')
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")

	-- Java LSP
	use("mfussenegger/nvim-jdtls")

	-- Rust
	use("simrat39/rust-tools.nvim")
	--
	-- Highlighting
	use("RRethy/vim-illuminate")

	use("christoomey/vim-tmux-navigator")
	use("ThePrimeagen/harpoon")
	use("simrat39/symbols-outline.nvim")
	use("b0o/SchemaStore.nvim")

	use("mbbill/undotree")

	use({
		"folke/noice.nvim",
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	})

	use("tpope/vim-fugitive")
	use("tpope/vim-dadbod")
	use("kristijanhusak/vim-dadbod-ui")
	use("kristijanhusak/vim-dadbod-completion")

	-- use "tversteeg/registers.nvim"

	---- Lazy loading:
	---- Load on specific commands
	--use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

	---- Load on an autocommand event
	--use {'andymass/vim-matchup', event = 'VimEnter'}

	---- Load on a combination of conditions: specific filetypes or commands
	---- Also run code after load (see the "config" key)
	--use {
	--  'w0rp/ale',
	--  ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
	--  cmd = 'ALEEnable',
	--  config = 'vim.cmd[[ALEEnable]]'
	--}

	---- Plugins can have dependencies on other plugins
	--use {
	--  'haorenW1025/completion-nvim',
	--  opt = true,
	--  requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
	--}

	---- Plugins can also depend on rocks from luarocks.org:
	--use {
	--  'my/supercoolplugin',
	--  rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
	--}

	---- You can specify rocks in isolation
	--use_rocks 'penlight'
	--use_rocks {'lua-resty-http', 'lpeg'}

	---- Local plugins can be included
	--use '~/projects/personal/hover.nvim'

	---- Plugins can have post-install/update hooks
	--use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

	---- Post-install/update hook with neovim command
	--use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	---- Post-install/update hook with call of vimscript function with argument
	--use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

	---- Use specific branch, dependency and run lua file after load
	--use {
	--  'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
	--  requires = {'kyazdani42/nvim-web-devicons'}
	--}

	---- Use dependency and run lua function after load
	--use {
	--  'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
	--  config = function() require('gitsigns').setup() end
	--}

	---- You can specify multiple plugins in a single call
	--use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

	---- You can alias plugin names
	--use {'dracula/vim', as = 'dracula'}
end)
