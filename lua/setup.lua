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
    "s1n7ax/nvim-window-picker",
    "catppuccin/nvim",
    "ggandor/leap.nvim",
    { "numToStr/Comment.nvim",     config = true },
    { "nvim-lualine/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" },
    "windwp/nvim-autopairs",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
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
    "lewis6991/gitsigns.nvim",
    "lukas-reineke/indent-blankline.nvim",
    { "akinsho/git-conflict.nvim", version = "*", config = true },

    -- lsp
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
}


local opts = {}


require("lazy").setup(plugins, opts)
