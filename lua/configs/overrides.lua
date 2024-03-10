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
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  autotag = {
    enable = true,
    enable_close_on_slash = true,
    filetypes = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "css",
      "lua",
      "xml",
      "php",
      "markdown",
      "blade",
    },
  },
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
        "!{.git/*,.svelte-kit/*,target/*,node_modules/*,.next/*}",
        "--path-separator",
        "/",
      },
    },
  },
}

-- M.comment = {
--   pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
-- }

return M
