-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "github/copilot.vim",
    { "catppuccin/nvim",      name = "catppuccin", priority = 1000 },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
    },

    "s1n7ax/nvim-window-picker",
    { "Mofiqul/dracula.nvim", priority = 1000 },
    "windwp/nvim-autopairs",
    "ggandor/leap.nvim",
    "lewis6991/gitsigns.nvim",
    "lukas-reineke/indent-blankline.nvim",

    -- lsp
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
    "jay-babu/mason-null-ls.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "folke/zen-mode.nvim",
    { "numToStr/Comment.nvim",           config = true },
    { "akinsho/git-conflict.nvim",       config = true },
    { "nvim-lualine/lualine.nvim",       requires = "kyazdani42/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", },
    { "nvim-telescope/telescope.nvim",   dependencies = "nvim-lua/plenary.nvim" },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
}

require("lazy").setup(plugins, {})
