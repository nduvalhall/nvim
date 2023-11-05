-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

-- configure treesitter
treesitter.setup({
    highlight = {
        enable = true,
    },
    ensure_installed = {
        "python",
        "c",
        "vue",
        "rust",
        "html",
        "css",
        "javascript",
        "typescript",
    },
})
