local M = {}

function M.checkOS()
	local system = vim.fn.systemlist("uname -r")
	return not not string.find(system[1] or "", "WSL")
end

return M
