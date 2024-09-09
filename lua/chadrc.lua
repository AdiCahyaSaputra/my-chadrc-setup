local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

---@class ChadrcConfig
local M = {}

local highlights = require "highlights"

M.ui = {
  tabufline = {
    order = { "treeOffset", "buffers", "btns" },
  },
  statusline = {
    theme = "minimal",
    separator_style = "block",
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
      custom_cwd = function ()
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
  -- theme_toggle = { "yoru", "one_light" },
}

M.base46 = {
  theme = "yoru",
  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
  lsp_semantic_tokens = false,
  integrations = {
    "hop",
    "trouble",
    "todo",
    "neogit",
  },
}

return M
