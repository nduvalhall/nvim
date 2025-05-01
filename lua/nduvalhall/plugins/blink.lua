return {
    'saghen/blink.cmp',
  version = '1.*',
    opts = {
        keymap = { preset = 'default', ['<C-e>'] = { 'hide', 'show', 'fallback' } },
        signature = { enabled = true, trigger = { enabled = false } },
        completion = { menu = { auto_show = false } },
    },
}
