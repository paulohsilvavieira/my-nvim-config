return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = {  text = "" },
				change = { text = "" },
				delete = { text = "" },
				untracked = { text = "" },
			},
			signcolumn = true,
		})

		vim.cmd("hi GitSignsAdd guifg=#98BE65")
		vim.cmd("hi GitSignsChange guifg=#ECBE7B")
		vim.cmd("hi GitSignsRemove guifg=#ECBE7B")
	end,
}
