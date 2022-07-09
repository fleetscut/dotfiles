local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.preselectSupport = true
M.capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
M.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
M.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
M.capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
M.capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
M.capabilities.textDocument.completion.completionItem.resolveSupport = { 
        properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
        }
     }

M.setup = function()
    require("fleetscut.lsp.lsp-signature")

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        width = 60,
        -- height = 30,
    })

   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
       border = "rounded",
       width = 60,
       -- height = 30,
   })

end

local function lsp_highlight_document(client)
  -- if client.server_capabilities.document_highlight then
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
  -- end
end

M.on_attach = function(client, bufnr)
  if client.name == "jdt.ls" then
    if JAVA_DAP_ACTIVE then
      require("jdtls").setup_dap({ hotcodereplace = 'auto' })
      require("jdtls.dap").setup_dap_main_class_configs()
    end
    --M.capabilities.textDocument.completion.completionItem.snippetSupport = false
    --client.resolved_capabilities.document_formatting = false
    vim.lsp.codelens.refresh()
  end

  require("fleetscut.keymaps").lsp_keymap(bufnr)
  lsp_highlight_document(client)
end

--M.setup()

return M
