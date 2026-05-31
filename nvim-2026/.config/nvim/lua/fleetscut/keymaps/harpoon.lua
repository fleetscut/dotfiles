local opts = { noremap = true, silent = true, buffer = bufnr }
local harpoon = require("miniharp")

vim.keymap.set("n", "<leader>a", harpoon.toggle_file, opts)
vim.keymap.set("n", "<leader>q", harpoon.show_list, opts)
-- vim.keymap.set('n',"n", "<leader>hc", ":lua require('require("harpoon").cmd-ui').toggle_quick_menu()<CR>", opts)
vim.keymap.set("n", "<M-n>", function()
	harpoon.go_to(1)
end, opts)
vim.keymap.set("n", "<M-e>", function()
	harpoon.go_to(2)
end, opts)
vim.keymap.set("n", "<M-i>", function()
	harpoon.go_to(3)
end, opts)
vim.keymap.set("n", "<M-o>", function()
	harpoon.go_to(4)
end, opts)
-- vim.keymap.set('n', "<leader><M-n>",
--     function()
--         harpoon:list():replace_at(1)
--     end, opts)
-- vim.keymap.set('n', "<leader><M-e>",
--     function()
--         harpoon:list():replace_at(2)
--     end, opts)
-- vim.keymap.set('n', "<leader><M-i>",
--     function()
--         harpoon:list():replace_at(3)
--     end, opts)
-- vim.keymap.set('n', "<leader><M-o>",
--     function()
--         harpoon:list():replace_at(4)
--     end, opts)
--
