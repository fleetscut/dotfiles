return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({
				-- for example, context is off by default, use this to turn it on
				scope = {
					enabled = true,
					show_start = true,
					show_end = true,
				},
			})
		end,
	},
}
