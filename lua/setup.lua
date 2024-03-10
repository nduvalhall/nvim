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
    { "catppuccin/nvim",                  priority = 1000 },
    { "rose-pine/neovim",                 priority = 1000 },
    { "loctvl842/monokai-pro.nvim",       priority = 1000 },
    { "folke/tokyonight.nvim",            priority = 1000 },
    { "sainnhe/sonokai",                  priority = 1000 },
    { "sainnhe/everforest",               priority = 1000 },
    { "sainnhe/gruvbox-material",         priority = 1000 },
    { "sainnhe/edge",                     priority = 1000 },
    { "oxfist/night-owl.nvim",            priority = 1000 },
    { "scottmckendry/cyberdream.nvim",    priority = 1000 },
    { "Yazeed1s/minimal.nvim",            priority = 1000 },
    { "nyoom-engineering/oxocarbon.nvim", priority = 1000 },
    { "EdenEast/nightfox.nvim",           priority = 1000 },






    "sindrets/diffview.nvim",
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "MunifTanjim/prettier.nvim",
    "github/copilot.vim",
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",                          opts = {} },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    "nanozuki/tabby.nvim",

    "s1n7ax/nvim-window-picker",
    "windwp/nvim-autopairs",
    "ggandor/leap.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "hoob3rt/lualine.nvim",
    "lewis6991/gitsigns.nvim",


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
    { "numToStr/Comment.nvim",               config = true },
    { "nvim-treesitter/nvim-treesitter",     build = ":TSUpdate", },
    { "nvim-telescope/telescope.nvim",       dependencies = "nvim-lua/plenary.nvim" },
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

local config = {
    lazy = false
}

require("lazy").setup(plugins, config)
