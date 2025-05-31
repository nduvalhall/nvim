return {
    'stevearc/oil.nvim',
    opts = {},
    config = function()
        require('oil').setup({
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                ['<Esc>'] = 'actions.close',
            },
        })
    end,
}
