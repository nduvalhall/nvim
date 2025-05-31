if vim.fn.has('wsl') == 1 then
    vim.api.nvim_create_autocmd('TextYankPost', {
        group = vim.api.nvim_create_augroup('Yank', { clear = true }),
        callback = function()
            vim.fn.system('clip.exe', vim.fn.getreg('"'))
        end,
    })
end

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

local lastplace = vim.api.nvim_create_augroup('LastPlace', {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd('BufReadPost', {
    group = lastplace,
    pattern = { '*' },
    desc = 'remember last cursor place',
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        if vim.fn.argc() == 0 then
            require('fzf-lua').files()
        end
    end,
})

vim.api.nvim_create_user_command('DeleteSwapFiles', function()
    local swap_dir = vim.fn.expand('~/.local/state/nvim/swap/')
    local deleted = vim.fn.delete(swap_dir, 'rf')
    if deleted == 0 then
        vim.fn.mkdir(swap_dir, 'p')
    end
end, {})
