return {
  'johmsalas/text-case.nvim',
  config = function()
    require('textcase').setup({})
  end,
  keys = {
    'ga', -- Default invocation prefix
    { 'ga.', '<cmd>TextCaseOpenTelescope<CR>', mode = { 'n', 'x' }, desc = 'Telescope' },
  },
  cmd = {
    'Subs',
    'TextCaseOpenTelescope',
    'TextCaseOpenTelescopeQuickChange',
    'TextCaseOpenTelescopeLSPChange',
    'TextCaseStartReplacingCommand',
  },
  lazy = false,
}
