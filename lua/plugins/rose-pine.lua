require('rose-pine').setup({
    disable_italics = true,
    dark_variant = "moon",
    enable_treesitter = false,
    disable_float_background = true,
    -- disable_background = true,

    highlight_groups = {
        ColorColumn = { bg = 'rose' },
    },
})

vim.cmd('colorscheme rose-pine')
