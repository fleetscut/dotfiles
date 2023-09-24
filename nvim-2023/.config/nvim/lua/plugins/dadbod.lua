return {
	"tpope/vim-dadbod",
	{
		"kristijanhusak/vim-dadbod-ui",
		init = function()
			require("fleetscut.keymaps").dadbod_ui_keymap()

			vim.g.db_ui_execute_on_save = 0
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	"kristijanhusak/vim-dadbod-completion",
}
