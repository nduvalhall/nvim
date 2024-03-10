vim.g.mapleader = " "
local keymap = vim.keymap.set
local n_opts = { silent = true, noremap = true }
local t_opts = { silent = true }

keymap("n", "<leader>h", ":nohl<CR>")
keymap("n", "x", '"_x')
keymap("n", "<leader>+", "<C-a>")
keymap("n", "<leader>-", "<C-x>")
keymap("n", "<leader>sv", "<C-w>v")
keymap("n", "<leader>sh", "<C-w>s")
keymap("n", "<leader>se", "<C-w>=")
keymap("n", "<leader>sx", ":close<CR>")
keymap("n", "<leader>sx", ":bd<CR>")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "j", "<Down>")
keymap("n", "k", "<Up>")
keymap("n", "h", "<Left>")
keymap("n", "l", "<Right>")
keymap("n", "<CR>", "ciw")
keymap("n", "<leader>lg", "<cmd>LazyGit<CR>")
keymap("n", "<leader>ln", "<cmd>set nu!<CR>")
keymap("n", "<leader>e", "<cmd>Explore<CR>")

-- Normal mode
-- Better window navigation
keymap('n', '<C-Left>', '<C-w>h', n_opts)
keymap('n', '<C-Down>', '<C-w>j', n_opts)
keymap('n', '<C-Up>', '<C-w>k', n_opts)
keymap('n', '<C-Right>', '<C-w>l', n_opts)

-- Terminal mode
keymap('n', '<leader>tt', '<cmd>ToggleTerm<CR>', n_opts)
keymap('t', '<esc>', '<C-\\><C-N>', t_opts)
keymap('t', '<C-Left>', '<C-\\><C-N><C-w>h', t_opts)
keymap('t', '<C-Down>', '<C-\\><C-N><C-w>j', t_opts)
keymap('t', '<C-Up>', '<C-\\><C-N><C-w>k', t_opts)
keymap('t', '<C-Right>', '<C-\\><C-N><C-w>l', t_opts)
