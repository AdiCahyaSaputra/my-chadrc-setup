-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  WinSeparator = {
    fg = "yellow",
  },
  Visual = {
    reverse = true
  },
  NormalFloat = {
    bg = "NONE",
  },
  Float = {
    bg = "NONE",
  },
  -- FloatBorder = {
  --   bg = "NONE",
  --   fg = "yellow",
  -- },
  -- Normal = {
  --   bg = "NONE",
  -- },
  -- NvDashAscii = {
  --   bg = "#000000",
  --   fg = "yellow",
  -- },
  SagaBorder = {
    fg = "NONE",
    bg = "NONE",
  },
  Todo = {
    fg = "vibrant_green",
    bg = "black2",
  },
  IlluminatedWordText = { bold = true, bg = 'black2', reverse = false },
  IlluminatedWordRead = { bold = true, bg = 'black2', reverse = false },
  IlluminatedWordWrite = { bold = true, bg = 'black2', reverse = false },
  CursorLine = {
    bg = "darker_black",
  },
  CmpPmenu = {
    bg = "darker_black",
  },
  DiagnosticVirtualTextHint = {
    bg = "NONE",
  },
  DiagnosticVirtualTextWarn = {
    bg = "NONE",
  },
  DiagnosticVirtualTextError = {
    bg = "NONE",
  },
  DiagnosticVirtualTextInfo = {
    bg = "NONE",
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  NormalNC = {
    bg = "NONE",
  },
}

return M
