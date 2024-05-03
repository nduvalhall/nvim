return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			notify_on_error = true,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				html = { "prettier" },
				vue = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				markdown = { "prettier" },
				sh = { "shfmt" },
			},
		})
	end,
}
