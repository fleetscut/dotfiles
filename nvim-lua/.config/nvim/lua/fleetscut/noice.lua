local noice_status, noice_config = pcall(require, "noice")
if not noice_status then
	return
end

noice_config.setup({
	cmdline = {
		enabled = true,
		view = "cmdline",
	},
	messages = {
		enabled = true,
	},
	routes = {
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
})
