return {
  setup = function(on_attach, on_init, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.prismals.setup({
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    })
  end,
}
