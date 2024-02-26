local opt = vim.opt

opt.tabstop = 4
opt.cmdheight = 0
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.number = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")
opt.swapfile = false
opt.so = 10
opt.termguicolors = true
opt.wrap = false
opt.colorcolumn = "80"
opt.clipboard = "unnamedplus"

if vim.fn.has('wsl') == 1 then
    vim.api.nvim_create_autocmd('TextYankPost', {
        group = vim.api.nvim_create_augroup('Yank', { clear = true }),
        callback = function()
            vim.fn.system('clip.exe', vim.fn.getreg('"'))
        end,
    })
end

vim.cmd('set clipboard+=unnamedplus')
