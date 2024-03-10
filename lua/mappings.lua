require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- [General]

-- Normal
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<A-j>", "<C-d>zz", { desc = "Scroll down + center screen", nowait = true })
map("n", "<A-k>", "<C-u>zz", { desc = "Scroll up + center screen", nowait = true })
map("n", "<leader>lf", function()
  require("conform").format()
end, { desc = "File Format with conform" })
map("n", "sv", ":vsplit<cr><C-w>l", { desc = "Vertical split", nowait = true })
map("n", "ss", ":split<cr><C-w>j", { desc = "Horizontal split", nowait = true })
map("n", "<leader>w", ":w<cr>", { desc = "Save the file", nowait = true })
map("n", "<leader>aw", ":HopWord<cr>", { desc = "Hop all word", nowait = true })

-- Visual
map("v", "<A-j>", "<C-d>zz", { desc = "Scroll down + center screen", nowait = true })
map("v", "<A-k>", "<C-u>zz", { desc = "Scroll up + center screen", nowait = true })

-- Insert
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- [Tabufline]

-- Normal
map("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "Next Buffer" })
map("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "Previous Buffer" })
map("n", "C", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close Buffer" })
map("n", "<C-b>c", ":tabnew<cr>", { desc = "New Tab" })
map("n", "<C-b>n", ":tabNext<cr>", { desc = "Next Tab" })
map("n", "<C-b>p", ":tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<C-b>w", ":tabclose<cr>", { desc = "Close Tab" })

-- [NvimTree]

-- Normal
map("n", "<leader>e", ":NvimTreeToggle<cr>", { desc = "Toggle nvim-tree" })
map("n", "<leader>o", ":NvimTreeFocus<cr>", { desc = "Focus nvim-tree" })

-- [LSP]

-- Normal
map("n", "<leader>dh", function()
  vim.diagnostic.goto_prev()
end, { desc = "Prev diagnostic" })
map("n", "<leader>dl", function()
  vim.diagnostic.goto_next()
end, { desc = "Next diagnostic" })
map("n", "<leader>lf", function()
  vim.lsp.buf.format { async = true }
end, { desc = "Format with lsp" })
map("n", "<leader>gd", function()
  require("telescope.builtin").lsp_definitions()
end, { desc = "Goto Definition" })
map("n", "<leader>ca", ":Lspsaga code_action<cr>", { desc = "Code action" })
map("n", "K", ":Lspsaga hover_doc<cr>", { desc = "Hover doc" })

-- [Terminal]

-- Normal and Terminal
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle {
    pos = "sp",
    id = "hTerm",
  }
end, { desc = "Terminal Toggle Horizontal term" })

-- map("t", "<C-k>", [[<C-\><C-N><C-w>k]], {
--   desc = "Switch to up windows  in terminal mode",
-- })
--
-- map("t", "<C-j>", [[<C-\><C-N><C-w>j]], {
--   desc = "Switch to down windows  in terminal mode",
-- })
--
-- map("t", "<C-h>", [[<C-\><C-N><C-w>h]], {
--   desc = "Switch to left windows in terminal mode",
-- })
--
-- map("t", "<C-l>", [[<C-\><C-N><C-w>l]], {
--   desc = "Switch to right windows in terminal mode",
-- })
