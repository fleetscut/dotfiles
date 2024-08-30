return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<F1>", ":lua require('dap').toggle_breakpoint()<CR>" },
			{ "<F2>", ":lua require('dap').step_into()<CR>" },
			{ "<F3>", ":lua require('dap').step_over()<CR>" },
			{ "<F4>", ":lua require('dap').step_out()<CR>" },
			{ "<F5>", ":lua require('dap').continue()<CR>" },
			{ "<F6>", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" },
			{ "<Leader>dl", ":lua require('dap').run_last()<CR>" },
			{ "<Leader>dt", ":lua require('dap').toggle()<CR>" },
			{ "<Leader>dx", ":lua require('dap').terminate()<CR>" },
		},
	},
	{ "rcarriga/nvim-dap-ui", keys = {
		{ "<Leader>du", ":lua require('dapui').toggle()<CR>" },
	} },
	"mfussenegger/nvim-dap-python",
	"theHamsta/nvim-dap-virtual-text",
}
