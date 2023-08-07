require('catppuccin').setup({
    flavour = "macchiato",
    no_italic = true,
    no_bold = true,
    integrations = {
        neotree = true,
        mason = true,
    }
})

vim.cmd('colorscheme catppuccin')
