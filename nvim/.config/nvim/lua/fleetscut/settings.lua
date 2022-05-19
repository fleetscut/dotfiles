local M = {}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.workspace = {
    configuration = true
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

M.capabilities = capabilities

function M.on_attach(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    local opts = { noremap=true, silent=true }
    local new_opts = {noremap=true, silent=true, buffer=bufnr}

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, new_opts)
    vim.keymap.set('n', 'gpd', ':Lspsaga preview_definition<CR>', new_opts)
    vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, new_opts)
    buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'cja', "<Cmd>lua require('jdtls').code_action(true)<CR>", opts)
    --    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --    vim.cmd "nnoremap <silent> <C-p> :lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<CR>"
    --    vim.cmd "nnoremap <silent> <C-n> :lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<CR>"
    --
    buf_set_keymap('n', 'cd', ':Lspsaga preview_definition<CR>', opts)
    buf_set_keymap('n', 'ca', ':Lspsaga code_action<CR>', opts)
    buf_set_keymap('v', 'cra', '<C-U>:Lspsaga range_code_action<CR>', opts)
    buf_set_keymap('n', 'clf', ':Lspsaga lsp_finder<CR>', opts)
    buf_set_keymap('n', 'crn', ':Lspsaga rename<CR>', opts)
    --buf_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', opts)
    vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', new_opts)
    vim.keymap.set('n', '<leader>df', ':Lspsaga diagnostic_jump_prev<CR>', new_opts)
    --vim.keymap.set('n', '<leader>df', vim.diagnostic.goto_prev, new_opts)
    vim.keymap.set('n', '<leader>dn', ':Lspsaga diagnostic_jump_next<CR>', new_opts)
    --vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, new_opts)
    buf_set_keymap('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
    buf_set_keymap('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)

    --vim.keymap.set('n', '<leader>fd', require("telescope.builtin").diagnostics, new_opts)

end

local comment_config = {
    ---Add a space b/w comment and the line
    ---@type boolean
    padding = true,

    ---Whether the cursor should stay at its position
    ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
    ---@type boolean
    sticky = true,

    ---Lines to be ignored while comment/uncomment.
    ---Could be a regex string or a function that returns a regex string.
    ---Example: Use '^$' to ignore empty lines
    ---@type string|function
    ignore = nil,

    ---LHS of toggle mappings in NORMAL + VISUAL mode
    ---@type table
    toggler = {
        ---line-comment keymap
        line = 'gcc',
        ---block-comment keymap
        block = 'gbc',
    },

    ---LHS of operator-pending mappings in NORMAL + VISUAL mode
    ---@type table
    opleader = {
        ---line-comment keymap
        line = 'gc',
        ---block-comment keymap
        block = 'gb',
    },

    ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
    ---@type table
    mappings = {
        ---operator-pending mapping
        ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
        ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
        basic = true,
        ---extra mapping
        ---Includes `gco`, `gcO`, `gcA`
        extra = true,
        ---extended mapping
        ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
        extended = false,
    },

    ---Pre-hook, called before commenting the line
    ---@type fun(ctx: Ctx):string
    pre_hook = nil,

    ---Post-hook, called after commenting is done
    ---@type fun(ctx: Ctx)
    post_hook = nil,
}
M.comment_config = comment_config
return M
