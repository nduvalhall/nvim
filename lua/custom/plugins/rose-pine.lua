return {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
        require('rose-pine').setup({
            variant = 'moon', -- auto, main, moon, or dawn
            dark_variant = 'moon', -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            enable = {
                terminal = true,
            },

            styles = {
                bold = false,
                italic = false,
                transparency = false,
            },
        })

    end,
}
