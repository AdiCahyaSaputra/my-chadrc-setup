---@class ChadrcConfig
local M = {}

local stl_utils = require "nvchad.stl.utils"
local highlights = require "highlights"

M.ui = {
  tabufline = {
    order = { "treeOffset", "buffers", "custom_tab", "btns" },
    modules = {
      custom_tab = function()
        local btn = require("nvchad.tabufline.utils").btn
        local fn = vim.fn
        local result, tabs = "", fn.tabpagenr "$"

        if tabs > 1 then
          for nr = 1, tabs, 1 do
            local tab_hl = "TabO" .. (nr == fn.tabpagenr() and "n" or "ff")
            result = result .. btn(" " .. nr .. " ", tab_hl, "GotoTab", nr)
          end

          local new_tabtn = btn("  ", "TabNewBtn", "NewTab")

          return new_tabtn .. result
        end

        return ""
      end
    }
  },
  statusline = {
    theme = "minimal",
    separator_style = "block",
    order = { "mode", "git", "custom_lsp", "lsp_msg", "diagnostics", "%=", "%=", "file", "cwd" },
    modules = {
      custom_lsp = function()
        local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)

        if rawget(vim, "lsp") then
          for _, client in ipairs(vim.lsp.get_clients()) do
            if client.attached_buffers[bufnr] then
              return (vim.o.columns > 100 and " %#St_lsp# " .. client.name .. " says -> ") or " %#St_lsp# No LSP attached "
            end
          end
        end

        return " %#St_lsp#No LSP attached "
      end
    }
  },
  cmp = {
    style = "flat_dark",
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    -- "                                                                                                   ",
    -- "███╗   ██╗ ██████╗  ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗     ███╗   ███╗██╗   ██╗██╗     ██╗   ██╗",
    -- "████╗  ██║██╔════╝ ██╔═══██╗██╔══██╗██║████╗  ██║██╔════╝     ████╗ ████║██║   ██║██║     ██║   ██║",
    -- "██╔██╗ ██║██║  ███╗██║   ██║██║  ██║██║██╔██╗ ██║██║  ███╗    ██╔████╔██║██║   ██║██║     ██║   ██║",
    -- "██║╚██╗██║██║   ██║██║   ██║██║  ██║██║██║╚██╗██║██║   ██║    ██║╚██╔╝██║██║   ██║██║     ██║   ██║",
    -- "██║ ╚████║╚██████╔╝╚██████╔╝██████╔╝██║██║ ╚████║╚██████╔╝    ██║ ╚═╝ ██║╚██████╔╝███████╗╚██████╔╝",
    -- "╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝     ╚═╝ ╚═════╝ ╚══════╝ ╚═════╝ ",
    -- "                                                                                                   ",
    "                            ",
    "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
    "   ▄▀███▄     ▄██ █████▀    ",
    "   ██▄▀███▄   ███           ",
    "   ███  ▀███▄ ███           ",
    "   ███    ▀██ ███           ",
    "   ███      ▀ ███           ",
    "   ▀██ █████▄▀█▀▄██████▄    ",
    "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
    "                            ",
    "       Ngoding Mulu 😎     ",
    "                            ",
  },
}

M.base46 = {
  theme = "jellybeans",
  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = false,
  lsp_semantic_tokens = false,
  integrations = {
    "hop",
    "trouble",
    "todo",
    "neogit",
    "vim-illuminate",
  },
}

M.colorify = {
  enabled = true
}

return M
