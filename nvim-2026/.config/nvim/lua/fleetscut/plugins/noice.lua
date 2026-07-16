local noice = require("noice")
noice.setup({
	cmdline = { enabled = false },
	-- messages = {
	-- 	enabled = true,
	-- },
	presets = {
		-- command_palette = true,
		lsp_doc_border = true,
	},

	lsp = {
		progress = {
			enabled = true,
		},
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		signature = {
			auto_open = {
				enabled = true,
			},
		},
		hover = {
			enabled = true,
			silent = true,
		},
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

	messages = {
		enabled = false,
	},

	popupmenu = {
		enabled = true,
		backend = "cmp",
	},
	signature = {
		enabled = true,
		trigger = true,
	},
})
