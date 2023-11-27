return {
	{
		"mickael-menu/zk-nvim",
		enabled = true,
		config = function()
			require("zk").setup({
				picker = "telescope",
			})
		end,
	},
}
