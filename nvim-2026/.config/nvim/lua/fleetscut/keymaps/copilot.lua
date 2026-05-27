local opts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set('i', '<C-y>', function()
                require("copilot.suggestion").accept()
            end, opts)
