vim.cmd.colorscheme('alabaster')
vim.opt.background = 'light'

local function highlight(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        highlight('CursorLine', { bg = '#DDDDDD' })
        highlight('ColorColumn', { bg = '#DDDDDD' })
        highlight('CursorLineNr', { fg = '#000000' })
        highlight('Number', { link = 'String' })
        highlight('Boolean', { link = 'String' })
        highlight('Character', { link = 'String' })
        highlight('@constructor.python', { link = '@function' })
    end,
})

vim.cmd('highlight DiagnosticUnderlineError gui=underline guisp=Red')
vim.cmd('highlight DiagnosticUnderlineWarn gui=underline guisp=Orange')
vim.cmd('highlight DiagnosticUnderlineInfo gui=underline guisp=Blue')
vim.cmd('highlight DiagnosticUnderlineHint gui=underline guisp=Gray')
