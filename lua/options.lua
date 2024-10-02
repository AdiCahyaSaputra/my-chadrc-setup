require "nvchad.options"

-- add yours here!
local opt = vim.opt
local g = vim.g
local o = vim.o

opt.wrap = false
opt.relativenumber = true
opt.mouse = ""
opt.cursorline = false
opt.cursorlineopt = "both"
opt.scrolloff = 20

-- o.foldmethod = 'indent'
-- o.foldlevel = 99
-- o.foldexpr = 'nvim_treesitter#foldexpr()'

o.shell = 'C:/Program Files/PowerShell/7/pwsh.exe'
o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command'
o.shellquote = ''
o.shellxquote = ''

g.skip_ts_context_commentstring_module = true

vim.cmd "au TextYankPost * silent! lua vim.highlight.on_yank()"
-- vim.cmd "au RecordingEnter * silent! set cmdheight=1"
-- vim.cmd "au RecordingLeave * silent! set cmdheight=0"

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
  vim.g.neovide_scroll_animation_length = 0
end
