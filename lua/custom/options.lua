vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.gruvbox_material_background = 'soft'

vim.opt.backspace = 'indent,eol,start'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeout = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 15
vim.opt.wrap = false
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.swapfile = false
vim.opt.cursorline = false
vim.opt.winborder = 'rounded'
vim.opt.cursorline = true
vim.opt.colorcolumn = '100'
vim.opt.list = true
vim.opt.listchars = { leadmultispace = '.   ', tab = '.  ' }

vim.filetype.add({
    extension = {
        mly = 'menhir',
        mll = 'ocamllex',
        tbd = 'tdb',
        porth = 'porth',
    },
})
