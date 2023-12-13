require('catppuccin').setup({
    transparent_background = true,
    flavour = "mocha",
    no_italic = true,
    no_bold = true,
    integrations = {
        neotree = true,
        mason = true,
    }
})

-- vim.cmd('colorscheme catppuccin')

require('rose-pine').setup({
    disable_italics = true,
})

vim.cmd('colorscheme rose-pine')
