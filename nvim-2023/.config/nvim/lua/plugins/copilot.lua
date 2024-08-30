local profile = os.getenv("PROFILE")

return {
	{
		"https://github.com/zbirenbaum/copilot.lua",
		enabled = function()
			if profile == "work" then
				return require("fleetscut.work.enabled").copilot_enabled
			else
				return false
			end
		end,
		config = function()
			if profile == "work" then
				vim.g.copilot_proxy = require("fleetscut.work.copilot").copilot_proxy
				vim.g.copilot_proxy_strict_ssl = require("fleetscut.work.copilot").copilot_proxy_strict_ssl
			end
			require("copilot").setup({
				suggestion = { enabled = true, auto_trigger = true },
				panel = { enabled = true, auto_refresh = true },
			})
		end,
		keys = {
			{
				"<C-y>",
				function()
					require("copilot.suggestion").accept()
				end,
				mode = { "i" },
			},
		},
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
