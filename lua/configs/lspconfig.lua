local map = vim.keymap.set
local nomap = vim.keymap.del

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = lspconfig.util
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
  -- "elixirls",
}

local custom_on_attach = function(client, bufnr)
  on_attach(client, bufnr)

  nomap("n", "K")

  map("n", "gd", function()
    require("telescope.builtin").lsp_definitions()
  end, { desc = "LSP: Goto Definition" })
  map("n", "<leader>ca", ":Lspsaga code_action<cr>", { desc = "LSP: Code action" })
  map("n", "K", ":Lspsaga hover_doc<cr>", { desc = "Hover doc" })
  map("n", "<leader>ra", ":Lspsaga rename<cr>", { desc = "LSP: Rename variable" })
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
    root_dir = function(fname)
      return util.root_pattern ".git" (fname)
          or util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", "composer.json", "mix.exs")(fname)
    end,
    -- root_dir = vim.fs.dirname(
    --   vim.fs.find(
    --     { ".git", "package.json", "tsconfig.json", "jsconfig.json", "composer.json", "mix.exs" },
    --     { upward = true }
    --   )[1]
    -- ),
  }
end

lspconfig.intelephense.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  filetypes = { "php", "blade" },
  root_dir = function(fname)
    return util.root_pattern ".git" (fname)
        or util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", "composer.json", "mix.exs")(fname)
  end,
}

lspconfig.elixirls.setup {
  cmd = { "/home/adics/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
  on_attach = custom_on_attach,
  capabilities = capabilities,
  root_dir = function(fname)
    return util.root_pattern ".git" (fname)
        or util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", "composer.json", "mix.exs")(fname)
  end,
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
