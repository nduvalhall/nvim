require('catppuccin').setup({
    flavour = "mocha",
    no_italic = true,
    no_bold = true,
    integrations = {
        neotree = true,
        mason = true,
    }
})


require('rose-pine').setup({
    disable_italics = true,
})


-- vim.cmd('colorscheme catppuccin')
-- vim.cmd('colorscheme rose-pine')
vim.cmd('colorscheme tokyonight-moon')
