local opts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set('n', '<Leader>du', ':DBUI<CR>', opts)
vim.keymap.set('n', '<Leader>dq', ':DBUIToggle<CR>', opts)
vim.keymap.set('n', '<Leader>dr', 'V<Plug>(DBUI_ExecuteQuery)<CR>', opts)
vim.keymap.set('n', '<Leader>dip', 'vip<Plug>(DBUI_ExecuteQuery)<CR>', opts)
vim.keymap.set('v', '<Leader>dr', '<Plug>(DBUI_ExecuteQuery)<CR>', opts)

