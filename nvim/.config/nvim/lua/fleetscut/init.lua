require("fleetscut.lsp")
require("fleetscut.telescope")
require("fleetscut.treesitter")

local settings = require("fleetscut.settings")
local comment_config = settings.comment_config

require("Comment").setup(comment_config)
