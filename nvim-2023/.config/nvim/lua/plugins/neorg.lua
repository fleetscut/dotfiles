return {
	"nvim-neorg/neorg",
	dependencies = {
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	ft = "norg",
	opts = {
		load = {
			["core.defaults"] = {},
			["core.completion"] = {
				config = {
					engine = "nvim-cmp",
					name = "[Norg]",
				},
			},
			["core.integrations.nvim-cmp"] = {},
			["core.concealer"] = { config = { icon_preset = "diamond" } },
			["core.keybinds"] = {
				config = {
					default_keybinds = true,
					neorg_leader = "<Leader><Leader>",
				},
			},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/Documents/notes/neorg",
					},
					default_workspace = "notes",
					index = "index.norg",
				},
			},
		},
	},
}
