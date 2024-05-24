local M = {}

local opts = { noremap = true, silent = true, buffer = bufnr }

M.leader = function()
	vim.g.mapleader = " "
end

M.java_keymap = function(bufnr)
	vim.keymap.set("n", "<Leader>jo", ":lua require('jdtls').organize_imports()<CR>", opts)
	vim.keymap.set({ "n", "v" }, "<Leader>jv", ":lua require('jdtls').extract_variable()<CR>", opts)
	vim.keymap.set({ "n", "v" }, "<Leader>jc", ":lua require('jdtls').extract_constant()<CR>", opts)
	vim.keymap.set("v", "<Leader>jm", ":lua require('jdtls').extract_method()<CR>", opts)
	vim.keymap.set("n", "<Leader>jt", ":lua require('jdtls').test_nearest_method()<CR>", opts)
	vim.keymap.set("n", "<Leader>jT", ":lua require('jdtls').test_class()<CR>", opts)
	vim.keymap.set("n", "<Leader>ja", ":lua require('jdtls').code_action()<CR>", opts)
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

M.telescope_keymap = function(bufnr)
	--vim.keymap.set("n", "<Leader>tt", ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>", opts)
	--vim.keymap.set("n", "<Leader>tt", ":lua require('telescope.builtin').find_files({hidden=truea})<CR>", opts)
	vim.keymap.set("n", "<Leader>t<Space>", ":Telescope builtin<CR>", opts)
	vim.keymap.set("n", "<Leader>tg", ":Telescope git_files<CR>", opts)
	vim.keymap.set("n", "<Leader>tt", ":Telescope find_files hidden=true no_ignore=true<CR>", opts)
	vim.keymap.set("n", "<Leader>tr", ":Telescope resume<CR>", opts)
	vim.keymap.set("n", "<Leader>tc", ":Telescope commands<CR>", opts)
	vim.keymap.set("n", "<Leader>ts", ":Telescope live_grep<CR>", opts)
	vim.keymap.set("n", "<Leader>tb", ":Telescope buffers<CR>", opts)
	vim.keymap.set("n", "<Leader>th", ":Telescope help_tags<CR>", opts)
	vim.keymap.set("n", "<Leader>tf", ":Telescope file_browser no_ignore=true<CR>", opts)
	vim.keymap.set("n", "<Leader>tw", ":Telescope file_browser path=%:p:h select_buffer=true no_ignore=true<CR>", opts)
	vim.keymap.set("n", "<Leader>tp", ":Telescope file_browser path=$HOME<CR>", opts)
	vim.keymap.set("n", "<Leader>td", ":Telescope diagnostics<CR>", opts)
	vim.keymap.set("n", "<Leader>tl", ":Telescope luasnip<CR>", opts)
end

M.general_keymap = function(bufnr)
	--vim.keymap.set("n", "<Leader>h", ":wincmd h<CR>", opts)
	--vim.keymap.set("n", "<Leader>l", ":wincmd l<CR>", opts)
	--vim.keymap.set("n", "<Leader>k", ":wincmd k<CR>", opts)
	--vim.keymap.set("n", "<Leader>j", ":wincmd j<CR>", opts)
	vim.keymap.set("n", "<M-j>", ":resize -2<CR>", opts)
	vim.keymap.set("n", "<M-k>", ":resize +2<CR>", opts)
	vim.keymap.set("n", "<M-h>", ":vertical resize -2<CR>", opts)
	vim.keymap.set("n", "<M-l>", ":vertical resize +2<CR>", opts)

	vim.keymap.set("n", "J", "mzJ`z", opts)
	vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
	vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
	vim.keymap.set("n", "n", "nzzzv", opts)
	vim.keymap.set("n", "N", "Nzzzv", opts)

	-- Gods gift to vim
	vim.keymap.set("i", "<C-c>", "<Esc>", opts)

	-- Sane tabbing
	vim.keymap.set("v", "<", "<gv", opts)
	vim.keymap.set("v", ">", ">gv", opts)

	-- Netrw
	vim.keymap.set("n", "<Leader>vv", ":Ex<CR>", opts)

	-- Black Hole register delete
	vim.keymap.set("x", "<Leader>p", '"_dP', opts)
	vim.keymap.set("n", "<Leader>d", '"_dd', opts)
	vim.keymap.set("v", "<Leader>d", '"_dd', opts)

	-- Yank to clipboard
	vim.keymap.set("n", "<Leader>y", '"+y', opts)
	vim.keymap.set("v", "<Leader>y", '"+y', opts)

	-- Paste from clipboard
	vim.keymap.set("n", "<Leader>p", '"+p', opts)
	vim.keymap.set("v", "<Leader>p", '"+p', opts)

	-- Yank file
	vim.keymap.set("n", "<Leader>Y", 'ggVG"+y', opts)

	-- Move lines up/down
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

	vim.keymap.set("n", "<Leader>lf", ":lua vim.lsp.buf.format({ async = true })<CR>", opts)
end

M.harpoon_keymap = function(harpoon)
	vim.keymap.set("n", "<leader>ha", function()
		harpoon:list():add()
	end, opts)
	vim.keymap.set("n", "<leader>hq", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, opts)
	-- vim.keymap.set("n", "<leader>hc", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>", opts)

	vim.keymap.set("n", "<M-n>", function()
		harpoon:list():select(1)
	end, opts)
	vim.keymap.set("n", "<M-e>", function()
		harpoon:list():select(2)
	end, opts)
	vim.keymap.set("n", "<M-i>", function()
		harpoon:list():select(3)
	end, opts)
	vim.keymap.set("n", "<M-o>", function()
		harpoon:list():select(4)
	end, opts)
	vim.keymap.set("n", "<leader><M-n>", function()
		harpoon:list():replace_at(1)
	end)
	vim.keymap.set("n", "<leader><M-e>", function()
		harpoon:list():replace_at(2)
	end)
	vim.keymap.set("n", "<leader><M-i>", function()
		harpoon:list():replace_at(3)
	end)
	vim.keymap.set("n", "<leader><M-o>", function()
		harpoon:list():replace_at(4)
	end)
end

M.dap_keymap = function(bufnr)
	vim.keymap.set("n", "<F1>", ":lua require('dap').toggle_breakpoint()<CR>", opts)
	vim.keymap.set("n", "<F2>", ":lua require('dap').step_into()<CR>", opts)
	vim.keymap.set("n", "<F3>", ":lua require('dap').step_over()<CR>", opts)
	vim.keymap.set("n", "<F4>", ":lua require('dap').step_out()<CR>", opts)
	vim.keymap.set("n", "<F5>", ":lua require('dap').continue()<CR>", opts)
	vim.keymap.set("n", "<F6>", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
	vim.keymap.set("n", "<Leader>dl", ":lua require('dap').run_last()<CR>", opts)
	--vim.keymap.set("n", "<Leader>du", ":lua require('dapui').toggle()<CR>", opts)
	vim.keymap.set("n", "<Leader>dt", ":lua require('dap').toggle()<CR>", opts)
	vim.keymap.set("n", "<Leader>dx", ":lua require('dap').terminate()<CR>", opts)
end

M.noice_keymap = function(bufnr)
	vim.keymap.set("n", "<c-f>", function()
		if not require("noice.lsp").scroll(4) then
			return "<c-f>"
		end
	end, { silent = true, expr = true })

	vim.keymap.set("n", "<c-b>", function()
		if not require("noice.lsp").scroll(-4) then
			return "<c-b>"
		end
	end, { silent = true, expr = true })
end

M.undotree_keymap = function(bufnr)
	vim.keymap.set("n", "<Leader>u", ":UndotreeToggle<CR>", opts)
end

M.dadbod_ui_keymap = function(bufnr)
	vim.keymap.set("n", "<Leader>du", ":DBUI<CR>", opts)
	vim.keymap.set("n", "<Leader>dq", ":DBUIToggle<CR>", opts)
	vim.keymap.set("n", "<Leader>dr", "V<Plug>(DBUI_ExecuteQuery)<CR>", opts)
	vim.keymap.set("n", "<Leader>dip", "vip<Plug>(DBUI_ExecuteQuery)<CR>", opts)
	vim.keymap.set("v", "<Leader>dr", "<Plug>(DBUI_ExecuteQuery)<CR>", opts)
end

M.zk_keymap = function()
	vim.keymap.set("n", "<Leader>zz", ":ZkNotes<CR>", opts)
	-- Create a new note after asking for its title.
	-- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
	vim.keymap.set(
		"n",
		"<leader>zn",
		"<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
		opts
	)
	-- Create a new note in the same directory as the current buffer, using the current selection for title.
	vim.keymap.set("v", "<leader>znt", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)
	-- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
	vim.keymap.set(
		"v",
		"<leader>znc",
		":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
		opts
	)

	-- Open notes linking to the current buffer.
	vim.keymap.set("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
	-- Alternative for backlinks using pure LSP and showing the source context.
	--map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
	-- Open notes linked by the current buffer.
	vim.keymap.set("n", "<leader>zl", "<Cmd>ZkLinks<CR>", opts)

	-- Open the code actions for a visual selection.
	vim.keymap.set("v", "<leader>za", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
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

M.oil_keymap = function(bufnr)
	local oil = require("oil")

	vim.keymap.set("n", "<leader>oo", ":lua require('oil').open()<CR>", { desc = "Open parent directory" })
	vim.keymap.set(
		"n",
		"<leader>or",
		":lua require('oil').open(vim.loop.cwd())<CR>",
		{ desc = "Open parent directory" }
	)
end

M.ls_keymap = function(bufnr)
	local ls = require("luasnip")
	vim.keymap.set({ "i", "s" }, "<C-l>", function()
		ls.jump(1)
	end, { silent = true })
	vim.keymap.set({ "i", "s" }, "<C-h>", function()
		ls.jump(-1)
	end, { silent = true })
end

return M
