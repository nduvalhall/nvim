require('zen-mode').setup({
    plugins = {
        twilight = { enabled = false },
        gitsigns = { enabled = false },
    },
    window = {
        options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
        },
    },
})

vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = true })
