return {
  setup = function(on_attach, on_init, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.kotlin_language_server.setup({
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
      -- cmd = { "C:\\Users\\Windows\\AppData\\Local\\nvim-data\\mason\\bin\\kotlin-language-server.cmd" },
      filetypes = { "kotlin" },
      root_dir = require('lspconfig.util').root_pattern("settings.gradle.kts", "build.gradle.kts", ".git"),
    })
  end,
}
