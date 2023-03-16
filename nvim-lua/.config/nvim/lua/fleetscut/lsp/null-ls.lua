local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	debug = false,
	sources = {
		formatting.stylua,
		formatting.black,
		formatting.prettier,
		formatting.rustfmt,
		-- formatting.clang_format.with({ extra_args = {'-style','"{IndentWidth: 4, ColumnLimit: 0}"'} }),
		-- formatting.google_java_format.with({ extra_args = { "--aosp" } }),
		diagnostics.ansiblelint.with({ extra_filetypes = { "yml" } }),
		diagnostics.yamllint,
		-- diagnostics.eslint_d,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						-- async = true,
						bufnr = bufnr,
						filter = function(client)
							return client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
