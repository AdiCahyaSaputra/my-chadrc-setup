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
    fg = "vibrant_green",
  },
  Visual = {
    bg = "black",
    reverse = true,
  },
  FloatBorder = {
    bg = "darker_black",
    fg = "darker_black",
  },
  -- Normal = {
  --   bg = "NONE",
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
  -- TblineFill = {
  --   bg = "black",
  -- },
  -- TbLineBufOn = {
  --   bg = "darker_black",
  -- },
  -- TbLineBufOnClose = {
  --   bg = "darker_black",
  -- },
  -- TbLineBufOnModified = {
  --   bg = "darker_black",
  -- },
  -- NvDashAscii = {
  --   bg = "NONE",
  --   fg = "vibrant_green",
  -- },
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
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
