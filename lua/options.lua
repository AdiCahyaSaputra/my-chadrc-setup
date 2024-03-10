require "nvchad.options"

-- add yours here!
local opt = vim.opt
local g = vim.g

opt.wrap = false
opt.relativenumber = true
opt.mouse = ""

g.skip_ts_context_commentstring_module = true

vim.cmd "au TextYankPost * silent! lua vim.highlight.on_yank()"

vim.filetype.add {
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
}

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h10"
  vim.g.neovide_padding_top = 20
  vim.g.neovide_padding_right = 20
  vim.g.neovide_padding_left = 20
end
