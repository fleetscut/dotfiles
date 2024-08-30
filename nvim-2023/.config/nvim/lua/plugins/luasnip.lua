return {
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		version = "v2.*",
		init = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip").filetype_extend("javascriptreact", { "html" })
			require("luasnip").filetype_extend("typescriptreact", { "html" })
			require("luasnip").filetype_extend("typescript", { "javascript" })
		end,
		keys = {
			{
				"<C-l>",
				function()
					require("luasnip").jump(1)
				end,
				mode = { "i", "s" },
				silent = true,
			},
			{
				"<C-h>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
				silent = true,
			},
		},
	},
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
}
