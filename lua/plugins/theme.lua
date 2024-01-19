return {
	"getomni/neovim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd.colorscheme("omni")
	end,
}
