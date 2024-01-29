require("neo-tree").setup {
    close_if_last_window = true,
    filesystem = {
        follow_current_file = true,
        use_libuv_file_watcher = true,
        filered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
        }
    },
}

vim.keymap.set("n", "<leader>e", "<cmd>NeoTreeFocusToggle<CR>")
