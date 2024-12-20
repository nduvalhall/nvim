return {
  'folke/zen-mode.nvim',
  dependencies = { 'folke/twilight.nvim', opts = {} },
  config = function()
    vim.keymap.set('n', '<leader>z', '<Cmd>ZenMode<CR>')
  end,
}
