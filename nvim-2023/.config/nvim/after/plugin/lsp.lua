vim.lsp.enable({ "zk", "gopls", "lua_ls" })
vim.diagnostic.config({
	virtual_lines = false,
	virtual_text = true,
})

require("fleetscut.lsp")
require("fleetscut.lsp.rust")
require("fleetscut.keymaps").lsp_keymap(bufnr)
