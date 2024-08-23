return {
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				-- providers: provider used to get references in the buffer, ordered by priority
				providers = {
					"lsp",
					"treesitter",
					"regex",
				},
				-- delay: delay in milliseconds
				delay = 100,
				-- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
				filetypes_denylist = {
					"properties",
				},
				-- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
				filetypes_allowlist = {},
				-- modes_denylist: modes to not illuminate, this overrides modes_allowlist
				modes_denylist = {},
				-- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
				modes_allowlist = {},
				-- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
				-- Only applies to the 'regex' provider
				-- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
				providers_regex_syntax_denylist = {},
				-- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
				-- Only applies to the 'regex' provider
				-- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
				providers_regex_syntax_allowlist = {},
				-- under_cursor: whether or not to illuminate under the cursor
				under_cursor = true,
			})
			-- vim.g.Illuminate_delay = 0
			-- vim.g.Illuminate_highlightUnderCursor = 0
			--vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree", "DressingSelect" }
			vim.keymap.set("n", "<M-f>", ':lua require("illuminate").goto_next_reference()<cr>', { noremap = true })
			vim.keymap.set("n", "<M-b>", ':lua require("illuminate").goto_prev_reference()<cr>', { noremap = true })
		end,
	},
}
