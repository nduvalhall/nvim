return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('oil').setup({
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                ['<Esc>'] = 'actions.close',
                ['<leader>e'] = 'actions.close',
            },
        })
        vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>')
    end,
}
