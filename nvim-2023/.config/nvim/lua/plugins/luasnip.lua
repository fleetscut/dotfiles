return {
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		init = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip").filetype_extend("javascriptreact", { "html" })
			require("luasnip").filetype_extend("typescriptreact", { "html" })
		end,
	},
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
}
