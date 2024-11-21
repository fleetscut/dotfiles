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
		opts = {
			-- cmdline = { enabled = true, view = "cmdline_popup" },
			-- messages = {
			-- 	enabled = true,
			-- },
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			presets = {
				command_palette = true,
				lsp_doc_border = true,
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
		keys = {
			{
				"<c-f>",
				function()
					if not require("noice.lsp").scroll(4) then
						return "<c-f>"
					end
				end,
				{ silent = true, expr = true },
			},
			{
				"<c-b>",
				function()
					if not require("noice.lsp").scroll(-4) then
						return "<c-b>"
					end
				end,
				{ silent = true, expr = true },
			},
		},
	},
}
