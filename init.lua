vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.cmdheight = 0
vim.opt.backspace = "indent,eol,start"
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true

if vim.fn.has("wsl") == 1 then
	vim.api.nvim_create_autocmd("TextYankPost", {
		group = vim.api.nvim_create_augroup("Yank", { clear = true }),
		callback = function()
			vim.fn.system("clip.exe", vim.fn.getreg('"'))
		end,
	})
end

vim.keymap.set("n", "j", "<Down>")
vim.keymap.set("n", "k", "<Up>")
vim.keymap.set("n", "h", "<Left>")
vim.keymap.set("n", "j", "<Right>")
vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
	group = lastplace,
	pattern = { "*" },
	desc = "remember last cursor place",
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local colorscheme_path = vim.fn.expand("$HOME/.local/state/nvim/colorscheme")
		local f = io.open(colorscheme_path, "r")

		if f then
			local colorscheme = f:read("*l")
			f:close()
			pcall(function()
				vim.cmd("colorscheme " .. colorscheme)
			end)
		end
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		local colorscheme_path = vim.fn.expand("$HOME/.local/state/nvim/colorscheme")
		local f = io.open(colorscheme_path, "w+")

		if f then
			f:write(vim.g.colors_name)
			f:close()
			return
		end
	end,
})

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

	{
		"ibhagwan/fzf-lua",
		config = function()
			require("fzf-lua").setup({})

			local fzf = require("fzf-lua")

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
			vim.keymap.set("n", "<leader>ld", fzf.lsp_definitions, { desc = "[F]ind [G]oto [D]efinitions" })
			vim.keymap.set("n", "gi", fzf.lsp_implementations, { desc = "[F]ind [G]oto [I]mplementations" })
			vim.keymap.set("n", "gr", fzf.lsp_references, { desc = "[G]oto [R]eferences" })
			vim.keymap.set("n", "<leader>ca", fzf.lsp_code_actions, { desc = "[C]ode [A]ctions" })

			-- misc
			vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "[F]ind [H]elp" })
			vim.keymap.set("n", "<leader>ft", fzf.colorschemes, { desc = "[F]ind [T]hemes" })
		end,
	},

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
		config = function()
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
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
					map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
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
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				vue = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
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

	{
		"github/copilot.vim",
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		init = function()
			require("ibl").setup({
				indent = {
					char = ".",
				},
				scope = { enabled = false },
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
		config = function()
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
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
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
