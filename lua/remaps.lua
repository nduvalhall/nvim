-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- clear search highlights
keymap.set("n", "<leader>h", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")
keymap.set("n", "<leader>sx", ":bd<CR>")

-- movement
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

-- remap to arrow keys
keymap.set("n", "j", "<Down>")
keymap.set("n", "k", "<Up>")
keymap.set("n", "h", "<Left>")
keymap.set("n", "l", "<Right>")

-- format
keymap.set("n", "<leader>F", "<cmd>lua vim.lsp.buf.format()<CR>")

-- random
keymap.set("n", "<CR>", "ciw")
