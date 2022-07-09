local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.stylua,
		formatting.black,
		-- formatting.clang_format.with({ extra_args = {'-style','"{IndentWidth: 4, ColumnLimit: 0}"'} }),
        formatting.google_java_format.with({ extra_args = { "--aosp" } }),
	},
})
