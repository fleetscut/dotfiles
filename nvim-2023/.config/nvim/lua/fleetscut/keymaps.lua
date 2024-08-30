local M = {}

local opts = { noremap = true, silent = true, buffer = bufnr }

M.java_keymap = function(bufnr)
	vim.keymap.set("n", "<Leader>jo", ":lua require('jdtls').organize_imports()<CR>", opts)
	vim.keymap.set({ "n", "v" }, "<Leader>jv", ":lua require('jdtls').extract_variable()<CR>", opts)
	vim.keymap.set({ "n", "v" }, "<Leader>jc", ":lua require('jdtls').extract_constant()<CR>", opts)
	vim.keymap.set("v", "<Leader>jm", ":lua require('jdtls').extract_method()<CR>", opts)
	vim.keymap.set("n", "<Leader>jt", ":lua require('jdtls').test_nearest_method()<CR>", opts)
	vim.keymap.set("n", "<Leader>jT", ":lua require('jdtls').test_class()<CR>", opts)
	vim.keymap.set("n", "<Leader>ja", ":lua require('jdtls').code_action()<CR>", opts)

	vim.keymap.set("n", "gG", ":lua vim.lsp.buf.definition()<CR>", opts)
end

M.lsp_keymap = function(bufnr)
	-- vim.keymap.set("n", "gG", ":lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "gG", ":Telescope lsp_definitions<CR>", opts)
	vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
	-- preview definition
	-- type definition
	-- vim.keymap.set("n", "gR", ":lua vim.lsp.buf.references()<CR>", opts)
	vim.keymap.set("n", "gR", ":Telescope lsp_references<CR>", opts)
	vim.keymap.set("n", "gr", ":lua vim.lsp.buf.rename()<CR>", opts)
	vim.keymap.set("n", "ga", ":lua vim.lsp.buf.code_action()<CR>", opts)
	vim.keymap.set("n", "gs", ":lua vim.lsp.buf.signature_help(true)<CR>", opts)
	vim.keymap.set("n", "gh", ":lua vim.lsp.buf.hover()<CR>", opts)
	vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", opts)

	vim.keymap.set("n", "<Leader>so", ":SymbolsOutline<CR>", opts)
end

M.gitsigns_keymap = function(bufnr)
	local gitsigns = require("gitsigns")

	local function map(mode, l, r, opts)
		opts = opts or {}
		opts.buffer = bufnr
		vim.keymap.set(mode, l, r, opts)
	end

	-- Navigation
	map("n", "]c", function()
		if vim.wo.diff then
			vim.cmd.normal({ "]c", bang = true })
		else
			gitsigns.nav_hunk("next")
		end
	end)

	map("n", "[c", function()
		if vim.wo.diff then
			vim.cmd.normal({ "[c", bang = true })
		else
			gitsigns.nav_hunk("prev")
		end
	end)

	-- Actions
	map("n", "<leader>hs", gitsigns.stage_hunk)
	map("n", "<leader>hr", gitsigns.reset_hunk)
	map("v", "<leader>hs", function()
		gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end)
	map("v", "<leader>hr", function()
		gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end)
	map("n", "<leader>hS", gitsigns.stage_buffer)
	map("n", "<leader>hu", gitsigns.undo_stage_hunk)
	map("n", "<leader>hR", gitsigns.reset_buffer)
	map("n", "<leader>hp", gitsigns.preview_hunk)
	map("n", "<leader>hb", function()
		gitsigns.blame_line({ full = true })
	end)
	map("n", "<leader>hB", gitsigns.toggle_current_line_blame)
	map("n", "<leader>hd", gitsigns.diffthis)
	map("n", "<leader>hD", function()
		gitsigns.diffthis("~")
	end)
	map("n", "<leader>td", gitsigns.toggle_deleted)

	-- Text object
	map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
end

return M
