require("neo-tree").setup {
    close_if_last_window = true,
    filesystem = {
        follow_current_file = true,
        use_libuv_file_watcher = true,
        hide_dotfiles = false,
    },
}

vim.keymap.set("n", "<leader>e", "<cmd>NeoTreeFocusToggle<CR>")
