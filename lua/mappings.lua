require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

nomap("t", "<C-x>")
-- nomap("t", "<Esc>")
nomap("n", "<C-n>")
nomap("n", "<leader>e")
nomap("n", "<tab>")
nomap("n", "<S-tab>")

-- [General]

-- Normal
map("n", ";", ":", { desc = "General: CMD enter command mode" })
map("n", "<A-j>", "<C-d>zz", { desc = "General: Scroll down + center screen", nowait = true })
map("n", "<A-k>", "<C-u>zz", { desc = "General: Scroll up + center screen", nowait = true })
-- map("n", "<leader>lf", function()
--   require("conform").format()
-- end, { desc = "General: File Format with conform" })
map("n", "sv", ":vsplit<cr><C-w>l", { desc = "General: Vertical split", nowait = true })
map("n", "ss", ":split<cr><C-w>j", { desc = "General: Horizontal split", nowait = true })
map("n", "<leader>w", ":w<cr>", { desc = "General: Save the file", nowait = true })

-- Visual
map("v", "<A-j>", "<C-d>zz", { desc = "General: Scroll down + center screen", nowait = true })
map("v", "<A-k>", "<C-u>zz", { desc = "General: Scroll up + center screen", nowait = true })

-- Insert
map("i", "jk", "<ESC>", { desc = "General: Escape insert mode" })

-- [Telescope]

-- Normal
-- map("n", "<leader>fp", ":Telescope projects<cr>", {
--   desc = "Telescope: cd project",
--   nowait = true,
--   silent = true,
-- })

map("n", "<leader>fp", ":CdProject<cr>", {
  desc = "Telescope: cd project",
  nowait = true,
  silent = true,
})

-- [Git]

-- Normal
map("n", "<leader>gd", ":Gvdiffsplit!<cr>", {
  desc = "Git: resolve git in 3 way merge",
  nowait = true,
  silent = false,
})

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
-- map("n", "<C-b>c", ":tabnew<cr>", { desc = "Tabufline: New Tab" })
-- map("n", "<C-b>n", ":tabNext<cr>", { desc = "Tabufline: Next Tab" })
-- map("n", "<C-b>p", ":tabprevious<cr>", { desc = "Tabufline: Previous Tab" })
-- map("n", "<C-b>w", ":tabclose<cr>", { desc = "Tabufline: Close Tab" })

-- [NvimTree]

-- Normal
map("n", "<leader>e", ":NvimTreeToggle<cr>", { desc = "Nvimtree: Toggle nvim-tree" })
map("n", "<leader>o", ":NvimTreeFocus<cr>", { desc = "Nvimtree: Focus nvim-tree" })

-- [Terminal]

-- Normal and Terminal
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "fTerm",
  }
end, { desc = "Terminal Toggle Float term" })

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

-- Create 1-5 Toggleable Float Terminal
local terminal_mapping = {}

for n = 1, 5 do
  table.insert(terminal_mapping, {
    "<A-" .. n .. ">f",
    function()
      require("nvchad.term").toggle {
        pos = "float",
        id = "fTerm" .. n,
      }
    end,
    { desc = "Terminal Toggle " .. n .. " Float term" },
  })

  table.insert(terminal_mapping, {
    "<A-" .. n .. ">h",
    function()
      require("nvchad.term").toggle {
        pos = "sp",
        id = "hTerm" .. n,
      }
    end,
    { desc = "Terminal Toggle " .. n .. " Horizontal term" },
  })

  table.insert(terminal_mapping, {
    "<A-" .. n .. ">v",
    function()
      require("nvchad.term").toggle {
        pos = "vsp",
        id = "vTerm" .. n,
        size = 0.5,
      }
    end,
    { desc = "Terminal Toggle " .. n .. " Vertical term" },
  })
end

for _, mapping in ipairs(terminal_mapping) do
  map({ "n", "t" }, mapping[1], mapping[2], mapping[3])
end

map({ "n", "t" }, "<leader>ft", ":Telescope terms<cr>", { desc = "Find terminal" })
