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
	--"jedi_language_server",
	"pyright", -- config options https://github.com/microsoft/pyright/blob/main/docs/configuration.md
	-- "pylsp",
	"lua_ls",
	"yamlls",
	"jsonls",
	"ts_ls",
	"clangd",
	"html",
	"gopls",
	-- "rust_analyzer",
}

local config = {}

for _, server in pairs(servers) do
	if server == "jedi_language_server" then
		PYTHON_DAP_ACTIVE = true
		config = require("fleetscut.lsp.python").config
	end
	if server == "pyright" then
		PYTHON_DAP_ACTIVE = true
		config = require("fleetscut.lsp.python").config
	end
	if server == "pylsp" then
		PYTHON_DAP_ACTIVE = true
		config = require("fleetscut.lsp.python").config
	end
	if server == "lua_ls" then
		config = require("fleetscut.lsp.lua-ls").config
	end
	if server == "yamlls" then
		config = require("fleetscut.lsp.yaml").config
	end
	if server == "jsonls" then
		config = require("fleetscut.lsp.json").config
	end
	if server == "ts_ls" then
		config = require("fleetscut.lsp.javascript").config
	end
	if server == "clangd" then
		config = require("fleetscut.lsp.cpp").config
	end
	if server == "html" then
		config = require("fleetscut.lsp.html").config
	end
	if server == "gopls" then
		config = require("fleetscut.lsp.go").config
	end
	-- if server == "rust_analyzer" then
	-- 	config = require("fleetscut.lsp.rust").config
	-- end
	config = vim.tbl_deep_extend("force", { on_attach = on_attach, capabilities = capabilities }, config)

	lspconfig[server].setup(config)
end

-- lspconfig.jedi_language_server.setup({ on_attach = on_attach, capabilities = capabilities })
-- lspconfig.pyright.setup{ on_attach = on_attach, capabilities = capabilities }

lsphandlers.setup()

require("fleetscut.lsp.null-ls")
require("fleetscut.lsp.lsp-signature")
