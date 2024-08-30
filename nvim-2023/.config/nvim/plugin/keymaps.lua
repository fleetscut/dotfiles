local opts = { noremap = true, silent = true, buffer = bufnr }

--vim.keymap.set("n", "<Leader>h", ":wincmd h<CR>", opts)
--vim.keymap.set("n", "<Leader>l", ":wincmd l<CR>", opts)
--vim.keymap.set("n", "<Leader>k", ":wincmd k<CR>", opts)
--vim.keymap.set("n", "<Leader>j", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<M-j>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<M-k>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<M-h>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<M-l>", ":vertical resize +2<CR>", opts)

vim.keymap.set("n", "J", "mzJ`z", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Gods gift to vim
vim.keymap.set("i", "<C-c>", "<Esc>", opts)

-- Sane tabbing
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Netrw
vim.keymap.set("n", "<Leader>vv", ":Ex<CR>", opts)

-- Black Hole register delete
vim.keymap.set("x", "<Leader>p", '"_dP', opts)
vim.keymap.set("n", "<Leader>d", '"_dd', opts)
vim.keymap.set("v", "<Leader>d", '"_dd', opts)

-- Yank to clipboard
vim.keymap.set("n", "<Leader>y", '"+y', opts)
vim.keymap.set("v", "<Leader>y", '"+y', opts)

-- Paste from clipboard
vim.keymap.set("n", "<Leader>p", '"+p', opts)
vim.keymap.set("v", "<Leader>p", '"+p', opts)

-- Yank file
vim.keymap.set("n", "<Leader>Y", 'ggVG"+y', opts)

-- Move lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("n", "<Leader>lf", ":lua vim.lsp.buf.format({ async = true })<CR>", opts)
