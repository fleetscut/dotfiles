local dap_status_status, dap = pcall(require, "dap")
if not dap_status_status then
	return
end

local dap_ui_status_status, dapui = pcall(require, "dapui")
if not dap_ui_status_status then
	return
end

local dap_virtual_text_status, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not dap_virtual_text_status then
	return
end

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			-- You can change the order of elements in the sidebar
			elements = {
				-- Provide as ID strings or tables with "id" and "size" keys
				{ id = "scopes", size = 0.25 },
				{ id = "breakpoints", size = 0.25 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 00.25 },
			},
			size = 40,
			position = "right", -- Can be "left", "right", "top", "bottom"
		},
		{
			elements = {
				{ id = "console", size = 0.25 },
				{ id = "repl", size = 0.25 },
			},
			size = 20,
			position = "bottom", -- Can be "left", "right", "top", "bottom"
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "rounded", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
})

-- local icons = require "user.icons"

--vim.fn.sign_define('DapBreakpoint', {text=icons.ui.Bug, texthl='DiagnosticSignError', linehl='', numhl=''})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

dap_virtual_text.setup({})
