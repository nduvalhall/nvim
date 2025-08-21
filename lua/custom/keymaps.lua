-- general
vim.keymap.set('n', 'h', '<Left>')
vim.keymap.set('n', 'j', '<Down>')
vim.keymap.set('n', 'k', '<Up>')
vim.keymap.set('n', 'l', '<Right>')
vim.keymap.set('n', '<leader>e', '<cmd>Explore<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohl<CR>')
vim.keymap.set('n', '<CR>', 'o<Esc>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { silent = true })

-- lsp
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)

-- oil
vim.keymap.set('n', '<leader>e', require('oil').open)

-- fzf
local fzf = require('fzf-lua')
vim.keymap.set('n', '<leader>ff', fzf.files)
vim.keymap.set('n', '<leader>fs', fzf.live_grep)
vim.keymap.set('n', '<leader>fc', fzf.grep_cword)
vim.keymap.set('n', '<leader>fdd', fzf.diagnostics_document)
vim.keymap.set('n', '<leader>fdw', fzf.diagnostics_workspace)
vim.keymap.set('n', '<leader><leader>', fzf.buffers)
vim.keymap.set('n', 'gi', fzf.lsp_implementations)
vim.keymap.set('n', 'grr', fzf.lsp_references)
vim.keymap.set('n', 'gd', fzf.lsp_definitions)
vim.keymap.set('n', 'gD', fzf.lsp_declarations)
vim.keymap.set('n', 'gt', fzf.lsp_typedefs)
vim.keymap.set('n', 'ga', fzf.lsp_code_actions)

-- lazygit
vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>')
