local map = vim.keymap.set

local nv_on_attach = require("nvchad.configs.lspconfig").on_attach
local nv_on_init = require("nvchad.configs.lspconfig").on_init
local nv_capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = {
  "html",
  "csharp_ls",
  "cssls",
  -- "ts_ls",
  "vtsls",
  "volar",
  "clangd",
  "intelephense",
  "prismals",
  "bashls",
  "eslint",
  "lua_ls",
  "elixirls",
  "jsonls",
  "rust_analyzer"
}

local on_attach = function(client, bufnr)
  nv_on_attach(client, bufnr) -- default nvchad on_attach func

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
  map({ "n", "v" }, "<leader>ca", function()
    require('tiny-code-action').code_action()
  end, opts "LSP: Code action")
  map("n", "K", ":Lspsaga hover_doc<cr>", opts "Hover doc")
  map("n", "<leader>ra", ":Lspsaga rename<cr>", opts "LSP: Rename variable")
end

for _, lsp in ipairs(servers) do
  local server_config_ok, mod = pcall(require, "configs.lsp.servers." .. lsp)
  if server_config_ok then
    mod.setup(on_attach, nv_on_init, nv_capabilities)
  end
end

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
