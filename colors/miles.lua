vim.o.termguicolors = true
vim.cmd [[syntax clear]]
vim.cmd [[hi clear]]
vim.g.colors_name = 'miles'
vim.opt.background = 'dark'

local function highlight(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

local fg = '#ffffff'
local bg = '#121516'
local bgg = '#252627'
highlight('Normal', { bg = bg, fg = fg })
highlight('CursorLine', { bg = bgg })

local plain = { fg = '#ffffff' }
highlight('Operator', plain)
highlight('Identifier', plain)
highlight('@constructor.lua', plain)
highlight('@variable', plain)

local fun = { fg = '#fef791', bold = true }
highlight('Function', fun)
highlight('@function.builtin.python', fun)
highlight('Directory', fun)
highlight('@constructor.python', fun)

local keyword = { fg = '#b275e8' }
highlight('Keyword', keyword)

local type = { fg = '#BBBBBB' }
highlight('Type', type)
highlight('@type.builtin.python', type)
highlight('@constant.builtin.python', type)
highlight('@type.python', type)
highlight('Operator', type)
highlight('Delimiter', type)
highlight('@punctuation.special.python', type)

local str = { fg = '#98c379' }
highlight('String', str)
highlight('Constant', str)

local comment = { fg = '#777777', italic = true }
highlight('Comment', comment)

local special = { fg = '#F1ACAC' }
highlight('Special', special)
