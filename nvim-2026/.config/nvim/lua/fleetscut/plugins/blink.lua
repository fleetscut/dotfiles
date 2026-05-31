local blink = require("blink.cmp")

blink.build():wait(10000)

blink.setup({
	keymap = {
		preset = "default",
	},
	completion = {
		trigger = {
			show_in_snippet = true,
			show_on_keyword = true,
			show_on_trigger_character = true,
		},
		menu = {
			auto_show = true,
			draw = {
				components = {
					kind_icon = {
						text = function(ctx)
							return require("lspkind").symbol_map[ctx.kind] or ""
						end,
					},
				},
			},
		},
		documentation = {
			auto_show = true,
		},
		accept = {
			auto_brackets = {
				enabled = true,
			},
		},
	},

	cmdline = {
		enabled = true,
		keymap = {
			preset = "cmdline",
		},
		completion = {
			menu = {
				auto_show = true,
			},
		},
	},

	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		per_filetype = {
			sql = { "snippets", "dadbod", "buffer" },
		},
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
			dadbod = {
				name = "Dadbod",
				module = "vim_dadbod_completion.blink",
			},
		},
	},

	appearance = {
		use_nvim_cmp_as_default = false,
	},
	snippets = {
		preset = "mini_snippets",
	},
})
