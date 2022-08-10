local autocmd = vim.api.nvim_create_autocmd
RustLspGroup = vim.api.nvim_create_augroup("RustLspGroup", {})
autocmd({ "CursorMoved", "InsertLeave", "BufEnter", "BufWinEnter", "TabEnter" }, {
	group = RustLspGroup,
	pattern = "*.rs",
	callback = function()
		require("lsp_extensions").inlay_hints({ prefix = " » " })
	end,
})
