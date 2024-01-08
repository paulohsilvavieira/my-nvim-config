return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            filters = {
                dotfiles = true,
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
                            arrow_open = "",
                            arrow_closed = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "",
                            staged = "S",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "U",
                            deleted = "",
                            ignored = "◌",
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
        }

        vim.keymap.set('n', "<leader>e", ":NvimTreeToggle<CR>", { silent = true })



        -- local function open_nvim_tree(data)
        --     -- buffer is a real file on the disk
        --     local real_file = vim.fn.filereadable(data.file) == 1

        --     -- buffer is a [No Name]
        --     local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

        --     -- open the tree, find the file but don't focus it
        --     require("nvim-tree.api").tree.toggle({ focus = false, find_file = false, })
        -- end
        -- local function open_nvim_tree_new_buffer(data)
        --     local directory = vim.fn.isdirectory(data.file) == 1

        --     if not directory then
        --         return
        --     end
        --     vim.cmd.enew()
        --     vim.cmd.bw(data.buf)
        --     vim.cmd.cd(data.file)
        --     require("nvim-tree.api").tree.open()
        -- end


        -- vim.g.nvim_tree_auto_open = 0
        -- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
        -- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree_new_buffer })
    end


}
