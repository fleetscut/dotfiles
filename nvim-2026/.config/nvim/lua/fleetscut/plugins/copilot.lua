local profile = os.getenv("PROFILE")

local enabled = false
if profile == "work" then
	return require("fleetscut.work.enabled").copilot_enabled
end

if enabled then
	vim.g.copilot_proxy = require("fleetscut.work.copilot").copilot_proxy
	vim.g.copilot_proxy_strict_ssl = require("fleetscut.work.copilot").copilot_proxy_strict_ssl
	local copilot = require("copilot")
	copilot.setup({
		suggestion = { enabled = false },
		panel = { enabled = false },
	})

	require("fleetscut.keymaps.copilot")
end
