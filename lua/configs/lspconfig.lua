local map = vim.keymap.set

local nv_on_init = require("nvchad.configs.lspconfig").on_init
local nv_capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = {
  "html",
  "csharp_ls",
  "cssls",
  "ts_ls",
  -- "vtsls",
  -- "volar",
  -- "clangd",
  "intelephense",
  "prismals",
  "bashls",
  "eslint",
  "lua_ls",
  "elixirls",
  "jsonls",
  "rust_analyzer",
  "angularls",
  "pyright",
  "dartls",
  "biome",
  "svelte"
  -- "kotlin_language_server"
}

vim.lsp.config("*", {
  on_attach = on_attach,
  on_init = nv_on_init,
  capabilities = nv_capabilities,
})
vim.lsp.enable(servers)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client.name == "svelte" then
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { ".js", ".ts" },
        group = vim.api.nvim_create_augroup("svelte_ondidchangetsorjsfile", { clear = true }),
        callback = function(ctx)
          -- Here use ctx.match instead of ctx.file
          client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
        end,
      })
    end

    -- vim.keymap.set
    map("n", "<leader>dh", function()
      vim.diagnostic.goto_prev()
    end)
    map("n", "<leader>dl", function()
      vim.diagnostic.goto_next()
    end)
    map("n", "<leader>lf", function()
      vim.lsp.buf.format { async = true }
    end)
    map("n", "gd", function()
      require("telescope.builtin").lsp_definitions()
    end)
    map({ "n", "v" }, "<leader>ca", function()
      require('tiny-code-action').code_action()
    end)
    map("n", "K", ":Lspsaga hover_doc<cr>")
    map("n", "<leader>ra", ":Lspsaga rename<cr>")

    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil') and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000, async = true })
        end,
      })
    end
  end,
})
