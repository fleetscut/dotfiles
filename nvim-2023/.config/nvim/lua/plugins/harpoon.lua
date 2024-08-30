return {
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		branch = "harpoon2",
		config = function()
			require("harpoon"):setup()
		end,
		keys = {

			{
				"<leader>ha",
				function()
					require("harpoon"):list():add()
				end,
			},
			{
				"<leader>hq",
				function()
					require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
				end,
			},
			-- {"n", "<leader>hc", ":lua require('require("harpoon").cmd-ui').toggle_quick_menu()<CR>", opts)

			{
				"<M-n>",
				function()
					require("harpoon"):list():select(1)
				end,
			},
			{
				"<M-e>",
				function()
					require("harpoon"):list():select(2)
				end,
			},
			{
				"<M-i>",
				function()
					require("harpoon"):list():select(3)
				end,
			},
			{
				"<M-o>",
				function()
					require("harpoon"):list():select(4)
				end,
			},
			{
				"<leader><M-n>",
				function()
					require("harpoon"):list():replace_at(1)
				end,
			},
			{
				"<leader><M-e>",
				function()
					require("harpoon"):list():replace_at(2)
				end,
			},
			{
				"<leader><M-i>",
				function()
					require("harpoon"):list():replace_at(3)
				end,
			},
			{
				"<leader><M-o>",
				function()
					require("harpoon"):list():replace_at(4)
				end,
			},
		},
	},
}
