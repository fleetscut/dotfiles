require("fleetscut.set")
require("fleetscut.packer")
require("fleetscut.lsp").setup()
require("fleetscut.cmp")
require("fleetscut.telescope")
require("fleetscut.dap")
require("fleetscut.illuminate")
require("fleetscut.tokyonight")
require("fleetscut.autopairs")
require("fleetscut.comment")
require("fleetscut.lualine")
require("fleetscut.indentline")
require("fleetscut.colorizer")
require("fleetscut.lsp.null-ls")

require("fleetscut.keymaps").telescope_keymap(bufnr)
require("fleetscut.keymaps").general_keymap(bufnr)
require("fleetscut.keymaps").harpoon_keymap(bufnr)
