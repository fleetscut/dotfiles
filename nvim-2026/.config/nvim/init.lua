vim.g.mapleader = " "

require("fleetscut.config")

local ok, err = pcall(require, "fleetscut.plugins")
if not ok then
	vim.notify("Error loading plugins: " .. err, vim.log.levels.ERROR)
end
