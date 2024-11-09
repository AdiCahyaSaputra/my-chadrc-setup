---@class ChadrcConfig
local M = {}

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
    theme = "default",
    separator_style = "default"
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
