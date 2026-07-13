vim.o.termguicolors = true
vim.cmd [[syntax clear]]
vim.cmd [[hi clear]]
vim.g.colors_name = 'carbon'
vim.opt.background = 'dark'

local function highlight(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

local palette = {
    -- carbon backgrounds / grays
    bg = '#121212',
    bgg = '#1a1a1a',
    bggg = '#252525', -- visual
    comment = '#666666',
    muted = '#9a9a9a', -- keyword / type
    fg = '#e6e6e6',
    fg_lite = '#f0f0f0',
    fg_max = '#ffffff',

    -- accents
    red = '#ff6b6b',
    orange = '#f29e74',
    yellow = '#ffd54a',
    green = '#b8d982',
    lime_green = '#ffd54a', -- functions
    cyan = '#76d4cf',
    blue = '#82b8e8',
    purple = '#c59be8',
    brown = '#c99585',
}

highlight('Normal', { bg = palette.bg, fg = palette.fg })
highlight('CursorLine', { bg = palette.bgg })
highlight('ColorColumn', { bg = palette.bgg })
highlight('Visual', { bg = palette.bggg })
highlight('CursorLineNr', { fg = palette.yellow })
highlight('NormalFloat', { bg = palette.bg, fg = palette.fg })
highlight('FloatBorder', { bg = palette.bg, fg = palette.bggg })
highlight('FloatTitle', { bg = palette.bg, fg = palette.yellow })

local plain = { fg = palette.fg }
highlight('Statement', plain)
highlight('Identifier', plain)
highlight('@constructor.lua', plain)
highlight('@variable', plain)
highlight('@type.definition.python', plain)
highlight('@punctuation.bracket', plain)
highlight('@punctuation.brace', plain)

local fun = { fg = palette.yellow }
highlight('Function', fun)
highlight('@function', fun)
highlight('@function.builtin', fun)
highlight('@function.builtin.python', fun)
highlight('Directory', fun)
highlight('@constructor.python', fun)

local module = { fg = palette.yellow, italic = true }
highlight('@module', module)
highlight('@module.lua', module)
highlight('@module.python', module)

local type = { fg = palette.muted }
highlight('Type', type)
highlight('@type', type)
highlight('@type.builtin.python', type)
highlight('@type.python', type)
highlight('@path', type)
highlight('@constant.builtin.python', type)

local keyword = { fg = palette.muted }
highlight('Keyword', keyword)
highlight('@keyword', keyword)
highlight('@variable.builtin.python', keyword)
highlight('Operator', keyword)
highlight('Delimiter', keyword)
highlight('@punctuation.special.python', keyword)

local comment = { fg = palette.comment, italic = true }
highlight('Comment', comment)
highlight('@comment', comment)
highlight('LineNr', { fg = palette.comment })

highlight('Special', { fg = palette.purple })
highlight('Constant', { fg = palette.orange })
highlight('String', { fg = palette.blue })
