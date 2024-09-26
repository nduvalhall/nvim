return {
	"neovim/nvim-lspconfig",
	init = function()
		vim.opt.updatetime = 250
		vim.lsp.set_log_level("error")
		vim.diagnostic.config({
			underline = true,
			update_in_insert = true,
			severity_sort = true,
		})
	end,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("gl", vim.diagnostic.open_float, "Show [L]ine Diagnostics")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			volar = {
				filetypes = {
					"vue",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"json",
					"jsonc",
				},
				init_options = {
					vue = {
						hybridMode = false,
					},
				},
			},

			pyright = {
				before_init = function(_, config)
					local p
					if vim.env.VIRTUAL_ENV then
						p = require("null-ls.utils").path.join(vim.env.VIRTUAL_ENV, "bin", "python3")
					else
						p = (".venv/bin/python3"):format(vim.fn.getcwd())
					end
					config.settings.python.pythonPath = p
				end,

				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "workspace",
							useLibraryCodeForTypes = true,
							typeCheckingMode = "strict",
						},
					},
				},
			},

			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								"${3rd}/luv/library",
								unpack(vim.api.nvim_get_runtime_file("", true)),
							},
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},

			ruff_lsp = {
				on_attach = function(client, bufnr)
					-- Disable hover in favor of Pyright
					client.server_capabilities.hoverProvider = false
					-- Organize imports via code action on save
					vim.api.nvim_create_autocmd("BufWritePre", {
						callback = function()
							vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
						end,
						buffer = bufnr,
					})
				end,
			},
		}

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua",
			"prettier",
		})

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
