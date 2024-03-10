local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- local configs = require "lspconfig.configs"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "intelephense",
  "prismals",
  "vuels",
  "bashls",
  -- "phpactor",
  "lua_ls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "php", "blade" },
}

-- configs.blade = {
--   default_config = {
--     cmd = { "../tools/laravel-dev-tools", "lsp" },
--     filetypes = { "blade" },
--     root_dir = function(fname)
--       return lspconfig.util.find_git_ancestor(fname)
--     end,
--     settings = {},
--   },
-- }
--
-- lspconfig.blade.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

--
-- lspconfig.pyright.setup { blabla}
