return {
	{
		"RRethy/vim-illuminate",
		init = function()
			-- vim.g.Illuminate_delay = 0
			-- vim.g.Illuminate_highlightUnderCursor = 0
			--vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree", "DressingSelect" }
			vim.api.nvim_set_keymap(
				"n",
				"<a-f>",
				'<cmd>lua require"illuminate".next_reference{wrap=true}<cr>',
				{ noremap = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<a-b>",
				'<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
				{ noremap = true }
			)
		end,
	},
}
