require("neo-tree").setup {
    close_if_last_window = true,
    filesystem = {
        follow_current_file = true,
    },
    buffers = {
        follow_current_file = true,
    }
}

vim.keymap.set("n", "<leader>e", "<cmd>NeoTreeFocus<CR>")
vim.keymap.set("n", "<leader>E", "<cmd>NeoTreeClose<CR>")
