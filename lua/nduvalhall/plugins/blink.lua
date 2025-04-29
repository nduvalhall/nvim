return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = 'v0.*',

  opts = {
    keymap = { preset = 'default', ['<C-e>'] = { 'hide', 'show', 'fallback' } },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    signature = { enabled = true, trigger = { enabled = false } },
    completion = { menu = { auto_show = false } },
  },
}
