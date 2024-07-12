return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			show_end_of_buffer = true,
			transparent_background = true,
		})
	end,
}
