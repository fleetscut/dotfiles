local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local lsphandlers_status, lsphandlers = pcall(require, "fleetscut.lsp.handlers")
if not lsphandlers_status then
	return
end

local capabilities = lsphandlers.capabilities
local on_attach = lsphandlers.on_attach

local servers = {
	"jedi_language_server",
	"sumneko_lua",
	-- "pyright",
	-- "pyls",
}

local config = {}

for _, server in pairs(servers) do
	if server == "jedi_language_server" then
		PYTHON_DAP_ACTIVE = true
		config = require("fleetscut.lsp.python").config
	end
	if server == "sumneko_lua" then
		config = require("fleetscut.lsp.lua-ls").config
	end

	config = vim.tbl_deep_extend("force", { on_attach = on_attach, capabilities = capabilities }, config)

	lspconfig[server].setup(config)
end

-- lspconfig.jedi_language_server.setup({ on_attach = on_attach, capabilities = capabilities })
-- lspconfig.pyright.setup{ on_attach = on_attach, capabilities = capabilities }

lsphandlers.setup()

require("fleetscut.lsp.null-ls")
require("fleetscut.lsp.lsp-signature")
