---@diagnostic disable: unused-local
local utils = require("nduvalhall.utils")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- colorschemes
	{ "catppuccin/nvim", priority = 1000 },
	{ "rose-pine/neovim", priority = 1000 },
	{ "loctvl842/monokai-pro.nvim", priority = 1000 },
	{ "folke/tokyonight.nvim", priority = 1000 },
	{ "sainnhe/sonokai", priority = 1000 },
	{ "sainnhe/everforest", priority = 1000 },
	{ "sainnhe/gruvbox-material", priority = 1000 },
	{ "sainnhe/edge", priority = 1000 },
	{ "oxfist/night-owl.nvim", priority = 1000 },
	{ "scottmckendry/cyberdream.nvim", priority = 1000 },
	{ "Yazeed1s/minimal.nvim", priority = 1000 },
	{ "nyoom-engineering/oxocarbon.nvim", priority = 1000 },
	{ "EdenEast/nightfox.nvim", priority = 1000 },

	{ "junegunn/fzf", build = "./install --bin" },

	{ "numToStr/Comment.nvim", opts = {} },

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		"folke/which-key.nvim",
		event = "VimEnter",
		init = function()
			require("which-key").setup()
			require("which-key").register({
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
				["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{ "j-hui/fidget.nvim", opts = {} },
		},
		init = function()
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
				gopls = {},
				volar = {},
				taplo = {},
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
								disableOrganizeImports = true,
							},
						},
					},
				},
				rust_analyzer = {},
				tsserver = {},
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
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
				"black",
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
	},

	{
		"ibhagwan/fzf-lua",
		init = function()
			require("fzf-lua").setup({})

			local fzf = require("fzf-lua")
			vim.keymap.set("n", "<leader>fb", fzf.builtin, { desc = "[F]ind [B]uiltin" })

			-- files
			vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>fs", fzf.grep, { desc = "[F]ind [S]tring" })
			vim.keymap.set("n", "<leader>fc", fzf.grep_cword, { desc = "[F]ind string under [C]ursor" })
			vim.keymap.set("n", "<leader>fdd", fzf.diagnostics_document, { desc = "[F]ind [D]iagnostics [D]ocument" })
			vim.keymap.set("n", "<leader>fdw", fzf.diagnostics_workspace, { desc = "[F]ind [D]iagnostics [W]orkspace" })
			vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "[F]ind [B]uffers" })

			-- git
			vim.keymap.set("n", "<leader>gf", fzf.git_files, { desc = "[F]ind [G]it [F]iles" })
			vim.keymap.set("n", "<leader>gb", fzf.git_branches, { desc = "[F]ind [G]it [B]ranches" })
			vim.keymap.set("n", "<leader>gs", fzf.git_status, { desc = "[F]ind [G]it [S]tatus" })

			-- lsp
			vim.keymap.set("n", "gi", fzf.lsp_implementations, { desc = "[F]ind [G]oto [I]mplementations" })
			vim.keymap.set("n", "gr", fzf.lsp_references, { desc = "[G]oto [R]eferences" })
			vim.keymap.set("n", "gd", fzf.lsp_definitions, { desc = "[G]oto [D]efinition" })
			vim.keymap.set("n", "gD", fzf.lsp_declarations, { desc = "[G]oto [D]eclarations" })
			vim.keymap.set("n", "gt", fzf.lsp_typedefs, { desc = "[G]oto [D]eclarations" })
			vim.keymap.set("n", "<leader>ca", fzf.lsp_code_actions, { desc = "[C]ode [A]ctions" })

			-- misc
			vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "[F]ind [H]elp" })
			vim.keymap.set("n", "<leader>ft", fzf.colorschemes, { desc = "[F]ind [T]hemes" })
		end,
	},

	{
		"iamcco/markdown-preview.nvim",
	},

	{
		"stevearc/conform.nvim",
		opts = {
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
		},
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	{
		"ggandor/leap.nvim",
		init = function()
			require("leap").add_default_mappings()
		end,
	},

	--[[ {
		"github/copilot.vim",
		init = function()
			vim.keymap.set("n", "<leader>ct", "<cmd>Copilot disable<CR>", { desc = "[C]opilot [T]oggle" })
		end,
	}, ]]

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		init = function()
			require("ibl").setup({
				indent = {
					char = ".",
				},
				scope = { enabled = false },
				exclude = {
					filetypes = { "NvimTree", "dashboard", "packer", "fzf", "fugitive", "git", "help", "lspinfo" },
				},
			})
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		init = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				filesystem = {
					follow_current_file = {
						enable = true,
					},
					use_libuv_file_watcher = true,
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = true,
					},
				},
				buffer = {
					follow_current_file = {
						enable = true,
					},
				},
			})
			vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle focus<CR>")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"rafamadriz/friendly-snippets",
		},
		init = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				mapping = cmp.mapping.preset.insert({
					["<Down>"] = cmp.mapping.select_next_item(),
					["<Up>"] = cmp.mapping.select_prev_item(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete({}),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"echasnovski/mini.nvim",
		init = function()
			require("mini.ai").setup({ n_lines = 500 })
			-- require("mini.surround").setup()
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		init = function()
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
	},
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
