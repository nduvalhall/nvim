-- 1) make sure truecolor is on
vim.o.termguicolors = true

-- 2) your palette (change these!)
local C = {
    bg = '#1A1A1A', -- graphite
    fg = '#E0E0E0',
    white = '#E0E0E0',
    yellow = '#E3E86B', -- functions/calls
    purple = '#9268AB', -- keywords
    red = '#E86671', -- parameters/args
    blue = '#4F89D1', -- types/modules/classes
    green = '#98C379', -- strings
    gray = '#949494',
    comment = '#6A6F7A', -- comments
}

-- 3) tiny helper
local function HL(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- 4) set base UI (optional but nice)
HL('Normal', { fg = C.fg, bg = C.bg })
HL('NormalFloat', { fg = C.fg, bg = C.bg })
HL('NormalFloatBorder', { fg = C.fg, bg = C.bg })
HL('LineNr', { fg = '#5c6370', bg = C.bg })
HL('CursorLine', { bg = '#2c313c' })
HL('CursorLineNr', { fg = C.yellow, bold = true })
HL('Visual', { bg = '#3a3f4b' })
HL('StatusLine', { fg = C.fg, bg = C.bg })
HL('Pmenu', { fg = C.fg, bg = C.bg })
HL('PmenuSel', { fg = C.bg, bg = C.blue, bold = true })

-- 5) classic highlight groups
HL('Function', { fg = C.yellow, bold = true })
HL('Identifier', { fg = C.yellow }) -- often function names too
HL('Keyword', { fg = C.purple, italic = true })
HL('Statement', { fg = C.purple })
HL('Type', { fg = C.blue })
HL('Constant', { fg = C.green })
HL('String', { fg = C.green })
HL('Number', { fg = C.green })
HL('Comment', { fg = C.comment, italic = true })
HL('Operator', { fg = C.fg })
HL('Delimiter', { fg = C.fg })
HL('Directory', { fg = C.red })

-- 6) Treesitter groups (covers most modern setups)
HL('@function', { fg = C.yellow })
HL('@function.call', { fg = C.yellow })
HL('@method', { fg = C.yellow })
HL('@parameter', { fg = C.red })
HL('@field', { fg = C.red })
HL('@variable.parameter', { fg = C.red })
HL('@variable', { fg = C.white })
HL('@type', { fg = C.gray })
HL('@type.builtin', { fg = C.gray })
HL('@module', { fg = C.white })
HL('@keyword', { fg = C.purple })
HL('@keyword.function', { fg = C.purple })
HL('@string', { fg = C.green })
HL('@comment', { fg = C.comment })
HL('@constant.builtin.python', { fg = C.fg })
HL('@constructor.python', { fg = C.yellow })
HL('@constructor.lua', { fg = C.fg })
HL('@function.builtin.python', { fg = C.yellow })
HL('@punctuation.special.python', { fg = C.fg })
HL('@function.builtin.bash', { fg = C.yellow })
HL('@variable.builtin.python', { fg = C.red })
