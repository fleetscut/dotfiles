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

			require("fleetscut.keymaps").ls_keymap()
		end,
	},
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
}
