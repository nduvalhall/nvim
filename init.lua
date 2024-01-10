require('setup')
require('theme')
require('remaps')
require('options')
require('plugins')

vim.opt.clipboard:append({ 'unnamedplus' })
vim.cmd("Copilot disable")
