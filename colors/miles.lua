vim.o.termguicolors = true
vim.cmd [[syntax clear]]
vim.cmd [[hi clear]]
vim.g.colors_name = 'miles'
vim.opt.background = 'dark'

local function highlight(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

local palette = {
    -- backgrounds / grays
    bg = '#2f3541',
    bgg = '#3c4353',
    bggg = '#4f5a6e', -- visual
    comment = '#63708b',
    muted = '#a7afc0', -- keyword / type
    fg = '#eceef2',
    fg_lite = '#f4f6fa',
    fg_max = '#fbfcff',

    -- accents
    red = '#ffb1b1',
    orange = '#f5c08a',
    yellow = '#fff493',
    green = '#bfdcb5',
    cyan = '#9fdcd2',
    blue = '#a5c8e8',
    purple = '#cdb1e8',
    brown = '#d4a59a',
}

highlight('Normal', { bg = palette.bg, fg = palette.fg })
highlight('CursorLine', { bg = palette.bgg })
highlight('ColorColumn', { bg = palette.bgg })
highlight('Visual', { bg = palette.bggg })
highlight('Visual', { bg = palette.bggg })
highlight('CursorLineNr', { fg = palette.fg })

local plain = { fg = palette.fg }
highlight('Operator', plain)
highlight('Identifier', plain)
highlight('@constructor.lua', plain)
highlight('@variable', plain)
highlight('@module.python', plain)

local fun = { fg = palette.yellow }
highlight('Function', fun)
highlight('@function.builtin.python', fun)
highlight('Directory', fun)
highlight('@constructor.python', fun)

local keyword = { fg = palette.muted }
highlight('Keyword', keyword)
highlight('@variable.builtin.python', keyword)

-- comment
local comment = { fg = palette.comment }
highlight('Comment', comment)
highlight('LineNr', comment)

local special = { fg = palette.red }
highlight('Special', special)
highlight('Constant', special)

local type = { fg = palette.muted }
highlight('Type', type)
highlight('@type.builtin.python', type)
highlight('@constant.builtin.python', type)
highlight('@type.python', type)
highlight('Operator', type)
highlight('Delimiter', type)
highlight('@punctuation.special.python', type)

local str = { fg = palette.green }
highlight('String', str)
