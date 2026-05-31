vim.keymap.set("n", "<Leader>jo", ":lua require('jdtls').organize_imports()<CR>", opts)
vim.keymap.set({ "n", "v" }, "<Leader>jv", ":lua require('jdtls').extract_variable()<CR>", opts)
vim.keymap.set({ "n", "v" }, "<Leader>jc", ":lua require('jdtls').extract_constant()<CR>", opts)
vim.keymap.set("v", "<Leader>jm", ":lua require('jdtls').extract_method()<CR>", opts)
vim.keymap.set("n", "<Leader>jt", ":lua require('jdtls').test_nearest_method()<CR>", opts)
vim.keymap.set("n", "<Leader>jT", ":lua require('jdtls').test_class()<CR>", opts)
vim.keymap.set("n", "<Leader>ja", ":lua require('jdtls').code_action()<CR>", opts)

vim.keymap.set("n", "gG", ":lua vim.lsp.buf.definition()<CR>", opts)
