require("indent_blankline").setup {
    filetype_exclude = { "filesystem" },
    indent = {
        char = { "⎜" },
    },
}

vim.cmd [[IndentBlanklineDisable]]
