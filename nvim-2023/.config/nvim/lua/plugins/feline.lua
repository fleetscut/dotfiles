return {
	"freddiehaddad/feline.nvim",
	opts = {},
    enabled = false,
	config = function(_, opts)
		local feline = require("feline")
		local ctp_feline = require("catppuccin.groups.integrations.feline")

		ctp_feline.setup()

		feline.setup({
			components = ctp_feline.get(),
		})
		-- feline.winbar.setup() -- to use winbar
		feline.statuscolumn.setup() -- to use statuscolumn
	end,
}
