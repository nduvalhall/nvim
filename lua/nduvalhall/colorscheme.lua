require("tokyonight").setup({
	transparent = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
})

vim.cmd("colorscheme tokyonight")
vim.cmd("hi StatusLine guibg=None")
vim.cmd("hi StatusLineNC guibg=None")
