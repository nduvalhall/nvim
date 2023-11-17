local keymap = vim.keymap

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope find_files hidden=true<cr>") -- find hidden files
keymap.set("n", "<leader>fe", "<cmd>Telescope file_browser<cr>") -- list available help tags
keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>") -- list available help tags
