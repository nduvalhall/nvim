return {
	"MeanderingProgrammer/dashboard.nvim",
	event = "VimEnter",
	dependencies = {
		{ "MaximilianLloyd/ascii.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
	},
	config = function()
		local directories = {}

		local file = io.open("/Users/mduvalhall/.local/share/proj/config", "r+")

		if file then
			local index = 1
			for line in file:lines("*l") do
				directories[index] = line
				index = index + 1
			end
		end

		require("dashboard").setup({
			header = require("ascii").art.text.neovim.sharp,
			directories = directories,
		})
	end,
}
