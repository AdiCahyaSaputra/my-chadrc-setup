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
  -- Visual = {
  --   bg = "one_bg3",
  -- },
  NormalFloat = {
    bg = "NONE",
  },
  Float = {
    bg = "NONE",
  },
  FloatBorder = {
    bg = "NONE",
    fg = "yellow",
  },
  -- Normal = {
  --   bg = "#000000",
  -- },
  -- St_NormalMode = {
  --   fg = "blue",
  --   bg = "black2",
  -- },
  -- St_InsertMode = {
  --   fg = "purple",
  --   bg = "black2",
  -- },
  -- St_VisualMode = {
  --   bg = "black2",
  -- },
  -- St_CommandMode = {
  --   bg = "black2",
  -- },
  TblineFill = {
    bg = "black",
  },
  TbLineBufOn = {
    bg = "darker_black",
  },
  TbLineBufOnClose = {
    bg = "darker_black",
  },
  TbLineBufOnModified = {
    bg = "darker_black",
  },
  NvDashAscii = {
    bg = "#000000",
    fg = "yellow",
  },
  SagaBorder = {
    fg = "NONE",
    bg = "NONE",
  },
  St_cwd = {
    fg = "teal",
    -- bg = "teal",
  },
  -- NvDashButtons = {
  --   bg = "NONE",
  -- },
  Todo = {
    fg = "vibrant_green",
    bg = "black2",
  },
  -- CursorLine = {
  --   bg = "darker_black",
  -- },
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
