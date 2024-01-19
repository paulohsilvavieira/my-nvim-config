return {
	"ojroques/nvim-bufdel",
	config = function()
		require("bufdel").setup({
			next = "cycle",
			quit = false, -- quit Neovim when last buffer is closed
		})
	end,
}
