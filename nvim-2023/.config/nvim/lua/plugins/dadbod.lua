return {
	"tpope/vim-dadbod",
	{
		"kristijanhusak/vim-dadbod-ui",
		init = function()
			vim.g.db_ui_execute_on_save = 0
			vim.g.db_ui_use_nerd_fonts = 1
		end,
		keys = {
			{ "<Leader>du", ":DBUI<CR>" },
			{ "<Leader>dq", ":DBUIToggle<CR>" },
			{ "<Leader>dr", "V<Plug>(DBUI_ExecuteQuery)<CR>" },
			{ "<Leader>dip", "vip<Plug>(DBUI_ExecuteQuery)<CR>" },
			{ "<Leader>dr", "<Plug>(DBUI_ExecuteQuery)<CR>", mode = { "v" } },
		},
	},
	"kristijanhusak/vim-dadbod-completion",
}
