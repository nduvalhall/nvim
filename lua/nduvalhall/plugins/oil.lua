return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			keymaps = {
				["<Esc>"] = "actions.close",
			},
		})
		vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")
	end,
}
