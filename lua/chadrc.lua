local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

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
    separator_style = "default",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "filetype", "custom_lsp", "custom_cwd" },
    modules = {
      filetype = function()
        local ft = vim.bo[stbufnr()].ft
        return ft == "" and "%#St_ft#  plain text  " or "%#St_ft#  " .. ft .. " "
      end,
      custom_lsp = function()
        if rawget(vim, "lsp") then
          for _, client in ipairs(vim.lsp.get_clients()) do
            if client.attached_buffers[stbufnr()] and client.name ~= "null-ls" then
              return (vim.o.columns > 100 and "%#St_Lsp# 󰈸 " .. client.name .. " ") or " 󰈸  LSP "
            end
          end
        end

        return ""
      end,
      custom_cwd = function()
        local name = vim.loop.cwd()
        name = "%#St_cwd# " .. (name:match "([^/\\]+)[/\\]*$" or name) .. " "

        return (vim.o.columns > 85 and name) or ""
      end
    },
  },
  cmp = {
    style = "flat_dark",
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "                                                                                                   ",
      "███╗   ██╗ ██████╗  ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗     ███╗   ███╗██╗   ██╗██╗     ██╗   ██╗",
      "████╗  ██║██╔════╝ ██╔═══██╗██╔══██╗██║████╗  ██║██╔════╝     ████╗ ████║██║   ██║██║     ██║   ██║",
      "██╔██╗ ██║██║  ███╗██║   ██║██║  ██║██║██╔██╗ ██║██║  ███╗    ██╔████╔██║██║   ██║██║     ██║   ██║",
      "██║╚██╗██║██║   ██║██║   ██║██║  ██║██║██║╚██╗██║██║   ██║    ██║╚██╔╝██║██║   ██║██║     ██║   ██║",
      "██║ ╚████║╚██████╔╝╚██████╔╝██████╔╝██║██║ ╚████║╚██████╔╝    ██║ ╚═╝ ██║╚██████╔╝███████╗╚██████╔╝",
      "╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝     ╚═╝ ╚═════╝ ╚══════╝ ╚═════╝ ",
      "                                                                                                   ",
    },
  },
  -- theme_toggle = { "gruvbox", "one_light" },
}

M.base46 = {
  theme = "tokyonight",
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

return M
