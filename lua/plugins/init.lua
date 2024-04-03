local overrides = require "configs.overrides"

return {
  { "typicode/bg.nvim",                lazy = false },
  {
    "nvim-pack/nvim-spectre",
    config = function()
      require "spectre"
    end,
    event = "BufReadPost",
  },
  "NvChad/nvcommunity",
  { import = "nvcommunity.lsp.lspsaga" },
  { import = "nvcommunity.motion.hop" },
  {
    "smoka7/hop.nvim",
    init = function()
      vim.keymap.set("n", "<leader>aw", ":HopWord<cr>", { desc = "Hop: Hop all word", nowait = true })
    end,
  },
  { import = "nvcommunity.tools.telescope-fzf-native" },
  {
    "nvimdev/lspsaga.nvim",
    opts = {
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
      border = "none",
    },
  },
  {
    "LintaoAmons/cd-project.nvim",
    config = function()
      require "configs.cd-project"
    end,
    event = "VimEnter",
    enabled = true,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require "configs.project"
    end,
    event = "VimEnter",
    enabled = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    dependencies = {
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup {
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
            "xml",
            "php",
            "markdown",
            "astro",
            "glimmer",
            "handlebars",
            "hbs",
            "blade",
          },
        }
      end,
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      dofile(vim.g.base46_cache .. "treesitter")
      require("nvim-treesitter.configs").setup(opts)

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "BufReadPost",
    config = true,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
    enabled = false,
  },

  {
    "folke/which-key.nvim",
    enabled = false,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "BufReadPost",
    enabled = false,
  },

  {
    "nvimtools/none-ls.nvim",
    event = "BufReadPost",
    opts = function()
      return require "configs.nonels"
    end,
  },

  {
    "numToStr/Comment.nvim",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          require("ts_context_commentstring").setup {
            enable_autocmd = false,
          }
        end,
      },
    },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
}
