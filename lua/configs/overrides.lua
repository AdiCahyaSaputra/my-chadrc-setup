local M = {}

M.treesitter = {
  ensure_installed = {
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    "php",
    "prisma",
    "vue",
    "dart",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  folding = {
    enable = true
  }
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "eslint-lsp",
    "prettierd",
    "phpactor",
    "prisma-language-server",
    "vue-language-server",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  filters = {
    dotfiles = true,
    exclude = nil,
    git_ignored = false,
  },
  git = {
    enable = true,
  },
  view = {
    relativenumber = true,
  },
  renderer = {
    root_folder_label = function(path)
      return "../" .. vim.fn.fnamemodify(path, ":t")
    end,
    full_name = true,
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  pickers = {
    find_files = {
      hidden = true,
      find_command = {
        "rg",
        "--files",
        "--glob",
        "!{.git/*,.svelte-kit/*,target/*,node_modules/*,.next/*,vendor/*,android/*,ios/*,windows/*,linux/*,build/*,.idea/*,.dart_tool/*}",
        "--path-separator",
        "/",
      },
    },
  },
  extensions_list = { "fzf" },
  defaults = {
    path_display = { "truncate" }
  }
}

M.cmp = {
  sources = {
    -- { name = "supermaven" },
    { name = "codeium" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  mapping = {
    ["<C-Space>"] = function ()
      print("Trigger completion")

      require "cmp".mapping.complete()
    end,
  },
}

-- M.comment = {
--   pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
-- }

return M
