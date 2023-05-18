-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- clear search highlights
keymap.set("n", "<leader>h", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>sx", ":bd<CR>")    -- close current split window

-- movement
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

-- terminal
keymap.set("n", "<leader>t", ":terminal<CR>")
keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- remap to arrow keys
keymap.set("n", "j", "<Down>")
keymap.set("n", "k", "<Up>")
keymap.set("n", "h", "<Left>")
keymap.set("n", "l", "<Right>")

-- nvim-tree

-- format
keymap.set("n", "<leader>F", "<cmd>lua vim.lsp.buf.format()<CR>")
