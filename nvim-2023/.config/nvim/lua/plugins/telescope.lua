local opts = require("fleetscut.keymaps").opts

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			--vim.keymap.set("n", "<Leader>tt", ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>", opts)
			--vim.keymap.set("n", "<Leader>tt", ":lua require('telescope.builtin').find_files({hidden=truea})<CR>", opts)
			{ "<Leader>t<Space>", ":Telescope builtin<CR>" },
			{ "<Leader>tg", ":Telescope git_files<CR>" },
			{ "<Leader>tt", ":Telescope find_files hidden=true no_ignore=true<CR>", desc = "" },
			{ "<Leader>tr", ":Telescope resume<CR>" },
			{ "<Leader>tc", ":Telescope commands<CR>" },
			{ "<Leader>ts", ":Telescope live_grep<CR>" },
			{ "<Leader>tb", ":Telescope buffers<CR>" },
			{ "<Leader>th", ":Telescope help_tags<CR>" },
			{ "<Leader>tf", ":Telescope file_browser no_ignore=true<CR>" },
			{
				"<Leader>tw",
				":Telescope file_browser path=%:p:h select_buffer=true no_ignore=true<CR>",
			},
			{ "<Leader>tp", ":Telescope file_browser path=$HOME<CR>" },
			{ "<Leader>td", ":Telescope diagnostics<CR>" },
			{ "<Leader>tl", ":Telescope luasnip<CR>" },
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		--		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		build = "make",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	"nvim-telescope/telescope-ui-select.nvim",
	"nvim-telescope/telescope-symbols.nvim",
	"benfowler/telescope-luasnip.nvim",
	{
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("neoclip").setup()
		end,
	},
}
