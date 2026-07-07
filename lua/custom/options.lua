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
vim.opt.winborder = 'single'
vim.opt.cursorline = true
vim.opt.colorcolumn = '88'
vim.opt.list = true
vim.opt.listchars = { leadmultispace = '.   ', tab = '.  ' }
vim.opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20'
vim.g.termfeatures = { sixel = false }

vim.filetype.add({
    extension = {
        mly = 'menhir',
        mll = 'ocamllex',
        tbd = 'tbd',
    },
})

vim.diagnostic.config({
    underline = true,
})
