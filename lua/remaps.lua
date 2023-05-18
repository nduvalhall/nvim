-- set leader key to space
vim.g.mapleader = " "

-- clear search highlights
vim.keymap.set("n", "<leader>h", ":nohl<CR>")

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>") -- increment
vim.keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s")     -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
vim.keymap.set("n", "<leader>sx", ":bd<CR>")    -- close current split window

-- movement
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- terminal
vim.keymap.set("n", "<leader>t", ":terminal<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- remap to arrow keys
vim.keymap.set("n", "j", "<Down>")
vim.keymap.set("n", "k", "<Up>")
vim.keymap.set("n", "h", "<Left>")
vim.keymap.set("n", "l", "<Right>")

-- nvim-tree
vim.keymap.set("n", "<leader>e", "<cmd>NeoTreeFocus<CR>")
vim.keymap.set("n", "<leader>E", "<cmd>NeoTreeClose<CR>")

-- format
vim.keymap.set("n", "<leader>F", "<cmd>lua vim.lsp.buf.format()<CR>")
