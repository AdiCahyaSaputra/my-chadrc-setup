local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end
local M = {}

local highlights = require "highlights"

M.ui = {
  theme = "flexoki",
  transparency = false,
  statusline = {
    theme = "vscode_colored",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "filetype", "custom_lsp", "cwd" },
    modules = {
      filetype = function()
        local ft = vim.bo[stbufnr()].ft
        return ft == "" and "%#St_ft#  plain text  " or "%#St_ft#  " .. ft .. " "
      end,
      custom_lsp = function()
        if rawget(vim, "lsp") then
          for _, client in ipairs(vim.lsp.get_active_clients()) do
            if client.attached_buffers[stbufnr()] and client.name ~= "null-ls" then
              return (vim.o.columns > 100 and "%#St_Lsp# 󰈸 " .. client.name .. " ") or "   LSP "
            end
          end
        end

        return ""
      end,
    },
  },
  cmp = {
    style = "flat_dark",
    selected_item_bg = "simple",
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
  -- theme_toggle = { "rosepine", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

return M
