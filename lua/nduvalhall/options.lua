local utils = require("nduvalhall.utils")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.opt.cmdheight = 0
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
vim.opt.cmdheight = 0

if vim.fn.has("wsl") == 1 then
	vim.api.nvim_create_autocmd("TextYankPost", {
		group = vim.api.nvim_create_augroup("Yank", { clear = true }),
		callback = function()
			vim.fn.system("clip.exe", vim.fn.getreg('"'))
		end,
	})
end

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

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.has("wsl") == 1 then
			local colorscheme_path = vim.fn.expand("$HOME/.local/state/nvim/colorscheme")
			local f = io.open(colorscheme_path, "r")

			if f then
				local colorscheme = f:read("*l")
				f:close()
				pcall(function()
					vim.cmd("colorscheme " .. colorscheme)
				end)
			end
		else
			if utils.capture("gsettings get org.gnome.desktop.interface color-scheme") == "'prefer-dark'" then
				vim.cmd("colorscheme tokyonight-moon")
			else
				vim.cmd("colorscheme dawnfox")
			end
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

vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		vim.opt.cmdheight = 1
	end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		vim.opt.cmdheight = 0
	end,
})
