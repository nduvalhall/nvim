return {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
        keymap = { preset = 'default', ['<C-e>'] = { 'hide', 'show', 'fallback' } },
        signature = { enabled = true, trigger = { enabled = false } },
        completion = { accept = { auto_brackets = { enabled = false } }, menu = { auto_show = false } },
    },
}
