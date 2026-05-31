-- vim.keymap.set("n", "gG", ":lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "gG", ":Telescope lsp_definitions<CR>", opts)
vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
-- preview definition
-- type definition
-- vim.keymap.set("n", "gR", ":lua vim.lsp.buf.references()<CR>", opts)
vim.keymap.set("n", "gR", ":Telescope lsp_references<CR>", opts)
vim.keymap.set("n", "gr", ":lua vim.lsp.buf.rename()<CR>", opts)
vim.keymap.set("n", "ga", ":lua vim.lsp.buf.code_action()<CR>", opts)
vim.keymap.set("n", "gs", ":lua vim.lsp.buf.signature_help(true)<CR>", opts)
vim.keymap.set("n", "gh", ":lua vim.lsp.buf.hover()<CR>", opts)
vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", opts)

vim.keymap.set("n", "<Leader>so", ":Outline<CR>", opts)
