vim.opt.textwidth = 80
vim.cmd("set fo+=t")
vim.cmd("set fo-=l")

-- Run only inside a zk notebook
-- if require("zk.util").notebook_root(vim.fn.expand("%:p")) ~= nil then
-- 	require("fleetscut.keymaps").zk_keymap()
-- end
