local M = {}

local opts = { noremap = true, silent = true, buffer = bufnr }

M.java_keymap = function(bufnr)

    vim.keymap.set("n", "<Leader>jo", ":lua require('jdtls').organize_imports()<CR>", opts)
    vim.keymap.set({"n", "v"}, "<Leader>jv", ":lua require('jdtls').extract_variable()<CR>", opts)
    vim.keymap.set({"n", "v"}, "<Leader>jc", ":lua require('jdtls').extract_constant()<CR>", opts)
    vim.keymap.set("v", "<Leader>jm", ":lua require('jdtls').extract_method()<CR>", opts)
    vim.keymap.set("n", "<Leader>jt", ":lua require('jdtls').test_nearest_method()<CR>", opts)
    vim.keymap.set("n", "<Leader>jT", ":lua require('jdtls').test_class()<CR>", opts)
    vim.keymap.set("n", "<Leader>ja", ":lua require('jdtls').code_action()<CR>", opts)

end

M.lsp_keymap = function(bufnr)

    vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
    -- preview definition
    -- type definition
    vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
    vim.keymap.set("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
    vim.keymap.set("n", "ga", ":lua vim.lsp.buf.code_action()<CR>", opts)
    vim.keymap.set("n", "gs", ":lua vim.lsp.buf.signature_help(true)<CR>", opts)
    vim.keymap.set("n", "gh", ":lua vim.lsp.buf.hover()<CR>", opts)
    

end

M.telescope_keymap = function(bufnr)

    --vim.keymap.set("n", "<Leader>tt", ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>", opts)
    --vim.keymap.set("n", "<Leader>tt", ":lua require('telescope.builtin').find_files({hidden=truea})<CR>", opts)
    vim.keymap.set("n", "<Leader>tt", ":Telescope find_files hidden=true<CR>", opts)
    vim.keymap.set("n", "<Leader>tr", ":Telescope resume<CR>", opts)
    vim.keymap.set("n", "<Leader>tc", ":Telescope commands<CR>", opts)
    vim.keymap.set("n", "<Leader>ts", ":Telescope live_grep<CR>", opts)
    vim.keymap.set("n", "<Leader>tb", ":Telescope buffers<CR>", opts)
    vim.keymap.set("n", "<Leader>th", ":Telescope help_tags<CR>", opts)
    vim.keymap.set("n", "<Leader>tf", ":lua require('telescope').extensions.file_browser.file_browser()<CR>", opts)
    vim.keymap.set("n", "<Leader>td", ":Telescope diagnostics<CR>", opts)

end

M.general_keymap = function(bufnr)

    --vim.keymap.set("n", "<Leader>ut", ":UndotreeToggle<CR>", opts)
    --vim.keymap.set("n", "<Leader>nt", ":NvimTreeToggle<CR>", opts)
    --vim.keymap.set("n", "<Leader>h", ":wincmd h<CR>", opts)
    --vim.keymap.set("n", "<Leader>l", ":wincmd l<CR>", opts)
    --vim.keymap.set("n", "<Leader>k", ":wincmd k<CR>", opts)
    --vim.keymap.set("n", "<Leader>j", ":wincmd j<CR>", opts)
    vim.keymap.set("n", "<M-j>", ":resize -2<CR>", opts)
    vim.keymap.set("n", "<M-k>", ":resize +2<CR>", opts)
    vim.keymap.set("n", "<M-h>", ":vertical resize -2<CR>", opts)
    vim.keymap.set("n", "<M-l>", ":vertical resize +2<CR>", opts)

    -- Gods gift to vim
    vim.keymap.set("i", "<C-c>", "<Esc>", opts)

    -- Sane tabbing
    vim.keymap.set("v", "<", "<gv", opts)
    vim.keymap.set("v", ">", ">gv", opts)

    -- Netrw
    vim.keymap.set("n", "<Leader>pv", ":Ex<CR>", opts)

    -- Black Hole register delete
    vim.keymap.set("x", "<Leader>p", "_ddP", opts)
    vim.keymap.set("n", "<Leader>d", "_dd", opts)
    vim.keymap.set("v", "<Leader>d", "_dd", opts)

    -- Yank to clipboard
    vim.keymap.set("n", "<Leader>y", '"+y', opts)
    vim.keymap.set("v", "<Leader>y", '"+y', opts)

    -- Paste from clipboard
    vim.keymap.set("n", "<Leader>p", '"+p', opts)

    -- Yank file
    vim.keymap.set("n", "<Leader>Y", 'ggVG"+y', opts)

    -- Move lines up/down
    vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
    vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
end

M.harpoon_keymap = function(bufnr)

vim.keymap.set("n","<leader>a", ":lua require('harpoon.mark').add_file()<CR>", opts)
vim.keymap.set("n","<C-m>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
vim.keymap.set("n","<leader>tc", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>", opts)

vim.keymap.set("n","<C-n>", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
vim.keymap.set("n","<C-e>", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
vim.keymap.set("n","<C-i>", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
vim.keymap.set("n","<C-o>", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)

end

return M
