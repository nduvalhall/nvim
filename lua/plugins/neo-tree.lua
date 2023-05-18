require("neo-tree").setup {
    statusline = false,
    close_if_last_window = true,
    reveal = true,
    filesystem = {
        follow_current_file = true,
    },
    buffers = {
        follow_current_file = true,
    }
}
