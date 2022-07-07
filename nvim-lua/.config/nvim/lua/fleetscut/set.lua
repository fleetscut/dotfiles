vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir= os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.scrolloff = 10
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.listchars:append("eol:$")
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.cmdheight = 1
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.mapleader = " "
