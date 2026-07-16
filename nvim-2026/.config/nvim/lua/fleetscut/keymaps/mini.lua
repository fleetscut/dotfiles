local opts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set("n", "<Leader>o", ":lua require('mini.files').open()<CR>", opts)
