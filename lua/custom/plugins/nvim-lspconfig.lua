return {
    dependencies = { 'j-hui/fidget.nvim' },
    'neovim/nvim-lspconfig',
    config = function()
        require('fidget').setup()
    end,
}
