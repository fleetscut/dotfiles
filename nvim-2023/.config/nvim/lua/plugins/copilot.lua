return {
	{
		"https://github.com/zbirenbaum/copilot.lua",
		config = function()
			vim.g.copilot_proxy = "localhost:3128"
			vim.g.copilot_proxy_strict_ssl = false
			require("copilot").setup({
				suggestion = { enabled = true, auto_trigger = true },
				-- panel = { enabled = false },
			})
		end,
	},
	-- {
	-- 	"https://github.com/zbirenbaum/copilot-cmp",
	-- 	enabled = false,
	-- 	dependencies = "copilot.lua",
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },
}
