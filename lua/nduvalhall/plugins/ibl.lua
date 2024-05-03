return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        require("ibl").setup({
            indent = {
                char = ".",
            },
            scope = { enabled = false },
            exclude = {
                filetypes = { "NvimTree", "dashboard", "packer", "fzf", "fugitive", "git", "help", "lspinfo" },
            },
        })
    end
}
