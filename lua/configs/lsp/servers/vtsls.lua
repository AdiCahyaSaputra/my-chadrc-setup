local mason_registry = require("mason-registry")
local vue_install_path = mason_registry.get_package("vue-language-server"):get_install_path()
local vue_language_server_path = vue_install_path .. "/node_modules/@vue/language-server"

local server_config = {
  updateImportsOnFileMove = { enabled = "always" },
  suggest = {
    completeFunctionCalls = true,
  },
  tsserver = {
    maxTsServerMemory = 8192,
  },
}

return {
  setup = function(on_attach, on_init, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.vtsls.setup({
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,

      settings = {
        vtsls = {
          enableMoveToFileCodeAction = true,
          autoUseWorkspaceTsdk = false,
          experimental = {
            maxInlayHintLength = 30,
            completion = {
              enableServerSideFuzzyMatch = true,
              entriesLimit = 30,
            },
          },
          tsserver = {
            globalPlugins = {
              {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
                configNamespace = "typescript",
                enableForWorkspaceTypeScriptVersions = true,
              },
            },
          },
        },
        typescript = server_config,
        javascript = server_config,
      },
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    })
  end,
}
