return {
    'rose-pine/neovim',
    name = 'rose-pine',
    branch = 'canary',
    config = function()
        require('rose-pine').setup({
            variant = 'moon',
            styles = {
                italic = false,
                bold = false,
            },
        })
    end,
}
