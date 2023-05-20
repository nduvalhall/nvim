require('zen-mode').setup({
    plugins = {
        twilight = { enabled = false },
    }
})

vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = true })
