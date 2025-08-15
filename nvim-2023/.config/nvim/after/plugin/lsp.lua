vim.lsp.enable({ "zk", "gopls" })
vim.diagnostic.config({
	virtual_lines = true,
	virtual_text = false,
})

require("fleetscut.lsp")
require("fleetscut.lsp.rust")
require("fleetscut.keymaps").lsp_keymap(bufnr)
