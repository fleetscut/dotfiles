local lspconfig_status, lspconfig = pcall(require,"lspconfig")
if not lspconfig_status then
    return
end

local sumneko_root_path = vim.fn.getenv("HOME").."/.local/share/nvim/lsp/lua/lua-language-server/"
local sumneko_binary = sumneko_root_path.. '/bin/lua-language-server'

local lsphandlers_status, lsphandlers = pcall(require,"fleetscut.lsp")
if not lsphandlers_status then
    return
end
local capabilities = lsphandlers.capabilities
local on_attach = lsphandlers.on_attach

lspconfig.sumneko_lua.setup {
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "main.lua"},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
