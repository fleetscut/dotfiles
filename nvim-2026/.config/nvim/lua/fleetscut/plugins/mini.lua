require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.surround").setup({
	mappings = {
		add = "gsa",
		delete = "gsd",
		find = "gsf",
		find_left = "gsF",
		highlight = "gsh",
		replace = "gsr",
		update_n_lines = "gsn",
	},
})
require("mini.cursorword").setup()
require("mini.indentscope").setup()
local snippets = require("mini.snippets")
snippets.setup({
	snippets = {
		require("mini.snippets").gen_loader.from_lang(),
	},
})
snippets.start_lsp_server()
require("mini.files")

require("fleetscut.keymaps.mini")
