return {

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    "fzf",
                },
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        height = 0.95,
                        prompt_position = 'top',
                    },
                    mappings = {
                        i = {
                            ["<A-v>"] = require("telescope.actions").file_vsplit,
                        },
                        n = {
                            ["<A-v>"] = require("telescope.actions").file_vsplit,
                        },
                    },
                },

            })
            require("telescope").load_extension("fzf")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>", {
                silent = true,
            })
            vim.keymap.set("n", "<leader>fa", ":Telescope find_files hidden=true no_ignore=true<cr>", { silent = true })

            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { silent = true, desc = 'Live Grep' })
        end,
    },
}
