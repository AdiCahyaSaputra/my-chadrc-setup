return {
  setup = function(on_attach, on_init, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.dartls.setup({
      on_attach = on_attach,
      on_init = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
      end,
      root_dir = function()
        return vim.loop.cwd()
      end,
    })
  end,
}
