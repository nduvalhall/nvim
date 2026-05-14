vim.o.termguicolors = true
vim.cmd [[syntax clear]]
vim.cmd [[hi clear]]
vim.g.colors_name = 'miles'
vim.opt.background = 'dark'

local function highlight(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- comment
local yellow = '#fef791'
local gray = '#999999'
local white = '#ffffff'
local green = '#98c379'
local bg = '#121516'
local bgg = '#252627'
local red = '#ff9999'
local orange = '#ffdd7f'

highlight('Normal', { bg = bg })
highlight('CursorLine', { bg = bgg })
highlight('Function', { fg = yellow, bold = true })
highlight('@function.builtin.python', { fg = yellow, bold = true })
highlight('Type', { fg = gray })
highlight('@type.builtin.python', { fg = gray })
highlight('Keyword', { fg = gray, italic = true })
highlight('String', { fg = green })
highlight('Identifier', { fg = white })
highlight('Special', { fg = orange })
highlight('Directory', { fg = yellow })
highlight('Constant', { fg = orange })
highlight('Comment', { fg = red, italic = true })
highlight('@module.python', { fg = white })
highlight('@variable.parameter.python', { fg = red, italic = true })
highlight('@string.documentation.python', { italic = true })
highlight('@constructor.python', { fg = yellow })
highlight('@constructor.lua', { fg = white })
