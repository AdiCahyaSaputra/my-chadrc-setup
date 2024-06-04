local map = vim.keymap.set

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- local configs = require "lspconfig.configs"

-- if you just want default config for the servers then put them in a table
local servers = {
  -- "html",
  "cssls",
  "tsserver",
  "clangd",
  -- "intelephense",
  "prismals",
  "vuels",
  "bashls",
  -- "phpactor",
  -- "lua_ls",
  -- "elixirls",
}

local custom_on_attach = function(client, bufnr)
  on_attach(client, bufnr) -- default nvchad on_attach func

  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end

  -- vim.keymap.set
  map("n", "<leader>dh", function()
    vim.diagnostic.goto_prev()
  end, opts "LSP: Prev diagnostic")
  map("n", "<leader>dl", function()
    vim.diagnostic.goto_next()
  end, opts "LSP: Next diagnostic")
  map("n", "<leader>lf", function()
    vim.lsp.buf.format { async = true }
  end, opts "LSP: Format with lsp")
  map("n", "gd", function()
    require("telescope.builtin").lsp_definitions()
  end, opts "LSP: Goto Definition")
  map({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<cr>", opts "LSP: Code action")
  map("n", "K", ":Lspsaga hover_doc<cr>", opts "Hover doc")
  map("n", "<leader>ra", ":Lspsaga rename<cr>", opts "LSP: Rename variable")
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
  }
end

lspconfig.html.setup {
  on_init = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentFormattingRangeProvider = false
  end,
  on_attach = custom_on_attach,
  capabilities = capabilities,
  filetypes = { "html", "templ", "blade" },
}

lspconfig.intelephense.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  filetypes = { "php", "blade" },
}

lspconfig.elixirls.setup {
  cmd = { "/home/adics/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
  on_attach = custom_on_attach,
  capabilities = capabilities,
}

lspconfig.dartls.setup {
  on_init = on_init,
  on_attach = custom_on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
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
