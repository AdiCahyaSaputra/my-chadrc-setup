return {
  setup = function(on_attach, on_init, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.biome.setup({
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    })
  end,
}
