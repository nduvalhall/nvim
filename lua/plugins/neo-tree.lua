require("neo-tree").setup {
    close_if_last_window = true,
    filesystem = {
        follow_current_file = true,
        use_libuv_file_watcher = true,
        show_hidden_files = true,
    },
}

vim.keymap.set("n", "<leader>e", "<cmd>NeoTreeFocus<CR>")
vim.keymap.set("n", "<leader>E", "<cmd>NeoTreeRevealToggle<CR>")
