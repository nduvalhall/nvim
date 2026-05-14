return {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_enable_italic = false
        vim.g.gruvbox_material_foreground = 'material'
        vim.g.gruvbox_material_background = 'hard'
        vim.g.gruvbox_material_disable_italic_comment = true
        vim.g.gruvbox_material_enable_bold = true
        vim.g.gruvbox_material_cursor = 'auto'
    end,
}
