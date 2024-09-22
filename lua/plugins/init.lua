local overrides = require "configs.overrides"

return {
  { "typicode/bg.nvim",   lazy = false,         enabled = false },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require "configs.supermaven"
    end,
    event = "BufReadPost",
    enabled = false,
  },
  {
    "code-biscuits/nvim-biscuits",
    opts = {
      cursor_line_only = false,
      default_config = {
        prefix_string = "  ",
      },
      language_config = {
        dart = {
          prefix_string = "  ",
        },
      },
    },
    event = "BufReadPost",
    config = true,
    enabled = false
  },
  { "tpope/vim-fugitive", event = "BufReadPost" },
  {
    "nvim-pack/nvim-spectre",
    config = function()
      require "spectre"
    end,
    event = "BufReadPost",
  },
  "NvChad/nvcommunity",
  { import = "nvcommunity.lsp.lspsaga" },
  { import = "nvcommunity.lsp.barbecue" },
  { import = "nvcommunity.motion.hop" },
  { import = "nvcommunity.git.diffview" },
  { import = "nvcommunity.git.neogit" },
  { import = "nvcommunity.tools.presence",   enabled = false },
  { import = "nvcommunity.motion.neoscroll" },
  { import = "nvcommunity.folds.ufo" },
  { import = "nvcommunity.editor.illuminate" },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure {
        under_cursor = true,
        max_file_lines = nil,
        delay = 100,
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        filetypes_denylist = {
          "NvimTree",
          "Trouble",
          "Outline",
          "TelescopePrompt",
          "Empty",
          "dirvish",
          "fugitive",
          "alpha",
          "packer",
          "neogitstatus",
          "spectre_panel",
          "toggleterm",
          "DressingSelect",
          "aerial",
        },
      }

      dofile(vim.g.base46_cache .. "vim-illuminate")
    end
  },
  {
    "kevinhwang91/nvim-ufo",
    init = function()
      vim.o.foldlevel = 99 -- Using ufo provider need a large value
      vim.o.foldlevelstart = 99
      vim.o.foldnestmax = 0
      vim.o.foldenable = true
      vim.o.foldmethod = "indent"

      vim.opt.fillchars = {
        fold = " ",
        foldopen = "",
        foldsep = " ",
        foldclose = "",
        stl = " ",
        eob = " ",
      }
    end,
  },
  {
    "karb94/neoscroll.nvim",
    -- keys = { "<C-d>", "<C-u>" },
    event = "BufReadPost",
    opts = {
      mappings = {
        "<C-u>",
        "<C-d>",
      },
      hide_cursor = false,
      respect_scrolloff = true
    },
    enabled = false,
    config = function()
      local neoscroll = require('neoscroll')

      local keymap = {
        ["<A-j>"] = function() neoscroll.ctrl_d({ duration = 50 }) end,
        ["<A-k>"] = function() neoscroll.ctrl_u({ duration = 50 }) end,
      }

      local modes = { 'n', 'v', 'x' }

      for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
      end
    end
  },
  {
    "smoka7/hop.nvim",
    init = function()
      dofile(vim.g.base46_cache .. "hop")

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
    'mg979/vim-visual-multi',
    branch = "master",
    init = function()
      vim.g.VM_maps = {
        ['Find Under']         = '<C-n>',
        ['Find Subword Under'] = '<C-n>',
        ['Add Cursor Down']    = '<C-Down>',
        ['Add Cursor Up']      = '<C-Up>',
      }
    end,
    lazy = false
  },
  {
    "LintaoAmons/cd-project.nvim",
    config = function()
      require "configs.cd-project"
    end,
    event = "VimEnter",
    enabled = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      dofile(vim.g.base46_cache .. "lsp")
      require("nvchad.lsp").diagnostic_config()

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
          opts = {
            enable_close_on_slash = true,
          },
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
    enabled = false
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
    event = "BufReadPost",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          require("ts_context_commentstring").setup {
            enable_autocmd = false,
          }
        end,
      },
      {
        "folke/ts-comments.nvim",
        opts = {
          lang = {
            html = '{{-- %s --}}'
          }
        }
      }
    },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }

      local ft = require('Comment.ft')

      ft.set('html', '{{-- %s --}}')

      vim.keymap.set('n', 'gcc', require('Comment.api').toggle.linewise.current)
    end,
  },
}
