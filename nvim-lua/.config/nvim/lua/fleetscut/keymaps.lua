local M = {}

local opts = { noremap = true, silent = true, buffer = bufnr }

M.lsp_keymap = function(bufnr)

    vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
    -- preview definition
    -- type definition
    vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
    vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
    vim.keymap.set("n", "ga", ":lua vim.lsp.buf.code_action(true)<CR>", opts)
    vim.keymap.set("n", "gs", ":lua vim.lsp.buf.signature_help(true)<CR>", opts)
    

end

M.telescope_keymap = function(bufnr)

    --vim.keymap.set("n", "<Leader>tt", ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>", opts)
    vim.keymap.set("n", "<Leader>tt", ":lua require('telescope.builtin').find_files()<CR>", opts)
    vim.keymap.set("n", "<Leader>tr", ":Telescope resume<CR>", opts)
    vim.keymap.set("n", "<Leader>tc", ":Telescope commands<CR>", opts)
    vim.keymap.set("n", "<Leader>tg", ":Telescope live_grep<CR>", opts)
    vim.keymap.set("n", "<Leader>tr", ":Telescope buffers<CR>", opts)
    vim.keymap.set("n", "<Leader>th", ":Telescope help_tags<CR>", opts)
    vim.keymap.set("n", "<Leader>tf", ":lua require('telescope').extensions.file_browser.file_browser()<CR>", opts)
    vim.keymap.set("n", "<Leader>td", ":Telescope diagnostics<CR>", opts)

end

return M
