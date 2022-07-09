local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local lsphandlers_status, lsphandlers = pcall(require, "fleetscut.lsp")
if not lsphandlers_status then
	return
end
local capabilities = lsphandlers.capabilities
local on_attach = lsphandlers.on_attach

PYTHON_DAP_ACTIVE = true

lspconfig.jedi_language_server.setup({ on_attach = on_attach, capabilities = capabilities })
-- lspconfig.pyright.setup{ on_attach = on_attach, capabilities = capabilities }
