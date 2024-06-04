local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

---@class ChadrcConfig
local M = {}

local highlights = require "highlights"

M.ui = {
  theme = "jellybeans",
  transparency = false,
  tabufline = {
    order = { "treeOffset", "buffers", "tabs", "btns" },
  },
  statusline = {
    theme = "default",
    separator_style = "round",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "filetype", "custom_lsp", "cwd" },
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
    },
  },
  cmp = {
    style = "flat_dark",
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "Menyala VSCode nya 󰈸              ",
      -- "󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸󰈸",
      -- "███╗   ██╗ ██████╗  ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗     ███╗   ███╗██╗   ██╗██╗     ██╗   ██╗",
      -- "████╗  ██║██╔════╝ ██╔═══██╗██╔══██╗██║████╗  ██║██╔════╝     ████╗ ████║██║   ██║██║     ██║   ██║",
      -- "██╔██╗ ██║██║  ███╗██║   ██║██║  ██║██║██╔██╗ ██║██║  ███╗    ██╔████╔██║██║   ██║██║     ██║   ██║",
      -- "██║╚██╗██║██║   ██║██║   ██║██║  ██║██║██║╚██╗██║██║   ██║    ██║╚██╔╝██║██║   ██║██║     ██║   ██║",
      -- "██║ ╚████║╚██████╔╝╚██████╔╝██████╔╝██║██║ ╚████║╚██████╔╝    ██║ ╚═╝ ██║╚██████╔╝███████╗╚██████╔╝",
      -- "╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝     ╚═╝ ╚═════╝ ╚══════╝ ╚═════╝ ",
      -- "                                                                                                   ",
    },
  },
  -- theme_toggle = { "rxyhn", "one_light" },
  lsp_semantic_tokens = false,
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.base46 = {
  integrations = {
    "hop",
    "trouble",
    "todo",
    "neogit",
  },
}

return M
