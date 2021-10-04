local M = {}

function M.on_attach()
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gp', '<Cmd>lua vim.lsp.buf.PeekDefinition()<CR>', opts)
    buf_set_keymap('n', 'cja', "<Cmd>lua require('jdtls').code_action(true)<CR>", opts)
--    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--    vim.cmd "nnoremap <silent> <C-p> :lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<CR>"
--    vim.cmd "nnoremap <silent> <C-n> :lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<CR>"
--    vim.cmd "nnoremap <silent> <tab> <cmd>lua vim.lsp.buf.signature_help()<CR>"
--
    buf_set_keymap('n', 'cd', ':Lspsaga preview_definition<CR>', opts)
    buf_set_keymap('n', 'ca', ':Lspsaga code_action<CR>', opts)
    buf_set_keymap('v', 'cra', '<C-U>:Lspsaga range_code_action<CR>', opts)
    buf_set_keymap('n', 'clf', ':Lspsaga lsp_finder<CR>', opts)
    buf_set_keymap('n', 'crn', ':Lspsaga rename<CR>', opts)
    buf_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', opts)
    buf_set_keymap('n', '<C-p>', ':Lspsaga diagnostic_jump_prev<CR>', opts)
    buf_set_keymap('n', '<C-n>', ':Lspsaga diagnostic_jump_next<CR>', opts)
    buf_set_keymap('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
    buf_set_keymap('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)
--    buf_set_keymap('n', '<tab>', ':Lspsaga signature_help<CR>', opts)
end

return M
