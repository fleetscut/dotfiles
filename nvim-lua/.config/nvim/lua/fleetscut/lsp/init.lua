local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = True
--M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

M.on_attach = function(client, bufnr)

  if client.name == "jdt.ls" then
    if JAVA_DAP_ACTIVE then
      require("jdtls").setup_dap { hotcodereplace = "auto" }
      require("jdtls.dap").setup_dap_main_class_configs()
    end
    --M.capabilities.textDocument.completion.completionItem.snippetSupport = false
    client.resolved_capabilities.document_formatting = false
    vim.lsp.codelens.refresh()
  end

  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end
