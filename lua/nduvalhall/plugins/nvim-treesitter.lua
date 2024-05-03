return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"html",
				"lua",
				"vue",
				"python",
				"javascript",
				"typescript",
				"markdown",
				"go",
				"rust",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
