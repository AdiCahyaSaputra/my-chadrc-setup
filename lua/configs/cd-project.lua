local cdp = require "cd-project"

local next = next

cdp.setup {
  projects_picker = "telescope",
  hooks = {
    {
      callback = function(_)
        if next(vim.lsp.get_active_clients()) ~= nil then
          vim.cmd "%bd!"
          vim.cmd "LspRestart"
        end
      end,
    },
  },
}
