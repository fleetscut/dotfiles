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
	vim.keymap.set("n", "gG", ":lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
	-- preview definition
	-- type definition
	vim.keymap.set("n", "gR", ":lua vim.lsp.buf.references()<CR>", opts)
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
	vim.keymap.set("n", "<Leader>tt", ":Telescope find_files hidden=true no_ignore=true<CR>", opts)
	vim.keymap.set("n", "<Leader>tr", ":Telescope resume<CR>", opts)
	vim.keymap.set("n", "<Leader>tc", ":Telescope commands<CR>", opts)
	vim.keymap.set("n", "<Leader>ts", ":Telescope live_grep<CR>", opts)
	vim.keymap.set("n", "<Leader>tb", ":Telescope buffers<CR>", opts)
	vim.keymap.set("n", "<Leader>th", ":Telescope help_tags<CR>", opts)
	vim.keymap.set("n", "<Leader>tf", ":Telescope file_browser<CR>", opts)
	vim.keymap.set("n", "<Leader>tw", ":Telescope file_browser path=%:p:h<CR>", opts)
	vim.keymap.set("n", "<Leader>tp", ":Telescope file_browser path=$HOME<CR>", opts)
	vim.keymap.set("n", "<Leader>td", ":Telescope diagnostics<CR>", opts)
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
		harpoon:list():append()
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
end

M.dap_keymap = function(bufnr)
	vim.keymap.set("n", "<F1>", ":lua require('dap').toggle_breakpoint()<CR>", opts)
	vim.keymap.set("n", "<F2>", ":lua require('dap').step_into()<CR>", opts)
	vim.keymap.set("n", "<F3>", ":lua require('dap').step_over()<CR>", opts)
	vim.keymap.set("n", "<F4>", ":lua require('dap').step_out()<CR>", opts)
	vim.keymap.set("n", "<F5>", ":lua require('dap').continue()<CR>", opts)
	vim.keymap.set("n", "<F6>", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
	vim.keymap.set("n", "<Leader>dl", ":lua require('dap').run_last()<CR>", opts)
	vim.keymap.set("n", "<Leader>du", ":lua require('dapui').toggle()<CR>", opts)
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
	vim.keymap.set("v", "<Leader>dr", "<Plug>(DBUI_ExecuteQuery)<CR>", opts)
end

return M
