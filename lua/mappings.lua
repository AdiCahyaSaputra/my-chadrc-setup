require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- [General]

-- Normal
map("n", ";", ":", { desc = "General: CMD enter command mode" })
map("n", "<A-j>", "<C-d>zz", { desc = "General: Scroll down + center screen", nowait = true })
map("n", "<A-k>", "<C-u>zz", { desc = "General: Scroll up + center screen", nowait = true })
map("n", "<leader>lf", function()
  require("conform").format()
end, { desc = "General: File Format with conform" })
map("n", "sv", ":vsplit<cr><C-w>l", { desc = "General: Vertical split", nowait = true })
map("n", "ss", ":split<cr><C-w>j", { desc = "General: Horizontal split", nowait = true })
map("n", "<leader>w", ":w<cr>", { desc = "General: Save the file", nowait = true })
map("n", "<leader>aw", ":HopWord<cr>", { desc = "General: Hop all word", nowait = true })

-- Visual
map("v", "<A-j>", "<C-d>zz", { desc = "General: Scroll down + center screen", nowait = true })
map("v", "<A-k>", "<C-u>zz", { desc = "General: Scroll up + center screen", nowait = true })

-- Insert
map("i", "jk", "<ESC>", { desc = "General: Escape insert mode" })

-- [Tabufline]

-- Normal
map("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "Tabufline: Next Buffer" })
map("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "Tabufline: Previous Buffer" })
map("n", "C", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Tabufline: Close Buffer" })
map("n", "<C-b>c", ":tabnew<cr>", { desc = "Tabufline: New Tab" })
map("n", "<C-b>n", ":tabNext<cr>", { desc = "Tabufline: Next Tab" })
map("n", "<C-b>p", ":tabprevious<cr>", { desc = "Tabufline: Previous Tab" })
map("n", "<C-b>w", ":tabclose<cr>", { desc = "Tabufline: Close Tab" })

-- [NvimTree]

-- Normal
map("n", "<leader>e", ":NvimTreeToggle<cr>", { desc = "Nvimtree: Toggle nvim-tree" })
map("n", "<leader>o", ":NvimTreeFocus<cr>", { desc = "Nvimtree: Focus nvim-tree" })

-- [LSP]

-- Normal
map("n", "<leader>dh", function()
  vim.diagnostic.goto_prev()
end, { desc = "LSP: Prev diagnostic" })
map("n", "<leader>dl", function()
  vim.diagnostic.goto_next()
end, { desc = "LSP: Next diagnostic" })
map("n", "<leader>lf", function()
  vim.lsp.buf.format { async = true }
end, { desc = "LSP: Format with lsp" })
map("n", "gd", function()
  require("telescope.builtin").lsp_definitions()
end, { desc = "LSP: Goto Definition" })
map("n", "<leader>ca", ":Lspsaga code_action<cr>", { desc = "LSP: Code action" })
map("n", "K", ":Lspsaga hover_doc<cr>", { desc = "Hover doc" })
map("n", "<leader>ra", ":Lspsaga rename<cr>", { desc = "LSP: Rename variable" })

-- [Terminal]

-- Normal and Terminal
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle {
    pos = "sp",
    id = "hTerm",
  }
end, { desc = "Terminal Toggle Horizontal term" })

map("t", "<C-k>", [[<C-\><C-N><C-w>k]], {
  desc = "Switch to up windows  in terminal mode",
})

map("t", "<C-j>", [[<C-\><C-N><C-w>j]], {
  desc = "Switch to down windows  in terminal mode",
})

map("t", "<C-h>", [[<C-\><C-N><C-w>h]], {
  desc = "Switch to left windows in terminal mode",
})

map("t", "<C-l>", [[<C-\><C-N><C-w>l]], {
  desc = "Switch to right windows in terminal mode",
})
