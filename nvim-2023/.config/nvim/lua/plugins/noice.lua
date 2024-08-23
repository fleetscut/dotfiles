local profile = os.getenv("PROFILE")

return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		enabled = function()
			if profile == "work" then
				return require("fleetscut.work.noice").noice_enabled
			else
				return true
			end
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		init = function()
			require("fleetscut.keymaps").noice_keymap(bufnr)
		end,
		opts = {
			cmdline = { enabled = true, view = "cmdline_popup" },
			messages = {
				enabled = true,
			},

			routes = {
				{
					filter = {
						event = "msg_show",
						find = "agenda command",
					},
					view = "cmdline",
				},
				{
					filter = {
						event = "msg_show",
						find = "capture template",
					},
					view = "popup",
				},
				{
					filter = {
						event = "msg_show",
						find = "written",
					},
					-- opts = { skip = true },
					view = "mini",
				},
				{
					filter = {
						event = "msg_show",
						find = "Already at newest change",
					},
					view = "mini",
				},
				{
					filter = {
						event = "exit Nvim",
						find = "Already at newest change",
					},
					opts = { skip = true },
				},
			},
		},
	},
}
