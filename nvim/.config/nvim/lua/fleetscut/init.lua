require("fleetscut.lsp")
require("fleetscut.telescope")
require("fleetscut.treesitter")
require("fleetscut.nvim-tree")
require("fleetscut.lualine")

local settings = require("fleetscut.settings")
local comment_config = settings.comment_config

require("Comment").setup(comment_config)
