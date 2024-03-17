--[[ return {
	"Mofiqul/dracula.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme dracula")
	end,
}
]]

return {
	"catppuccin/nvim",
	priority = 1000,
	name = "catppuccin",
	config = function ()
		vim.cmd ("colorscheme catppuccin-mocha")
	end,
}
