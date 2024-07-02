return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.nvim_tree_disable_default_keybindings = 1

		local function on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts()
				return { buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.set("n", "<A-v>", api.node.open.vertical, opts("Open Vertical"))
			vim.keymap.set("n", "<A-x>", api.node.open.horizontal, opts("Open Horizontal"))
		end

		require("nvim-tree").setup({
			filters = {
				enable = true,
				dotfiles = false,
				git_ignored = false,
				custom = { ".git" },
			},
			hijack_directories = {
				enable = false,
			},

			hijack_cursor = false, -- put cursor at start of filename
			update_cwd = true,

			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			
			renderer = {
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_open = "",
							arrow_closed = "",
							default = "󰉋",
							open = "󰝰",
							empty = "󰉖",
							empty_open = "󰷏 ",
							symlink = "",
							symlink_open = "",
						},
						
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌ " ,
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			on_attach = on_attach,
		})

		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = "Open Explorer" })

		vim.g.nvim_tree_auto_open = 0
		-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
		-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree_new_buffer })
	end,
}
