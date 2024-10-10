return {
  setup = function(on_attach, on_init, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.html.setup({
      on_attach = on_attach,
      on_init = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
      end,
      capabilities = capabilities,
      filetypes = { "html", "templ", "blade" },
    })
  end,
}
