require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
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
