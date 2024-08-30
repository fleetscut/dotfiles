return {
	{
		"mickael-menu/zk-nvim",
		enabled = true,
		config = function()
			require("zk").setup({
				picker = "telescope",
			})
		end,
		keys = {

			{ "zZ", ":lua vim.lsp.buf.definition()<CR>" },
			{ "<Leader>zz", ":ZkNotes<CR>" },
			-- Create a new note after asking for its title.
			-- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
			{
				"<leader>zn",
				"<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
			},
			-- Create a new note in the same directory as the current buffer, using the current selection for title.
			{ "<leader>znt", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", mode = { "v" } },
			-- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
			{
				"<leader>znc",
				":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
				mode = { "v" },
			},

			-- Open notes linking to the current buffer.
			{ "<leader>zb", "<Cmd>ZkBacklinks<CR>" },
			-- Alternative for backlinks using pure LSP and showing the source context},
			--map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
			-- Open notes linked by the current buffer.
			{ "<leader>zl", "<Cmd>ZkLinks<CR>" },

			-- Open the code actions for a visual selection.
			{ "<leader>za", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", mode = { "v" } },
		},
	},
}
