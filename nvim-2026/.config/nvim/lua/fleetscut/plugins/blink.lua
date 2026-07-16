local blink = require("blink.cmp")

blink.build():wait(10000)

blink.setup({
	keymap = {
		preset = "default",
		["<c-n>"] = { "select_next" },
		["<c-p>"] = { "select_prev" },
		["<c-b>"] = { "scroll_documentation_up" },
		["<c-f>"] = { "scroll_documentation_down" },
		["<c-space>"] = { "show" },
		["<c-t>"] = { "cancel" },
		["<c-s>"] = { "select_and_accept" },
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
			border = "rounded",
			winblend = 10,
			-- winhighlight = "Normal:Normal,FloatBorder:NormalFloat",
			scrollbar = true,
		},
		documentation = {
			auto_show = true,
			window = {
				border = "rounded",
			},
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
			snippets = {
				module = "blink.cmp.sources.snippets",
			},
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
		use_nvim_cmp_as_default = true,
	},
	snippets = {
		preset = "mini_snippets",
	},
	signature = {
		enabled = true,
	},
})
