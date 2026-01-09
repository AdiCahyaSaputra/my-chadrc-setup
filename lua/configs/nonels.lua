local null_ls = require "null-ls"

local group = vim.api.nvim_create_augroup("my.nonels", { clear = false })

local opts = {
  sources = {
    -- null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.blade_formatter.with {
      filetypes = { "blade" },
    },
    -- null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.biome,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.phpcsfixer
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
}

return opts
