return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            {
                "nvim-telescope/telescope-dap.nvim",
            } },
        config = function()
            require("telescope").setup({
                extensions = {
                    "fzf",
                    "dap",
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("fzf")
            require('telescope').load_extension('dap')

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<C-p>', ":Telescope find_files<cr>", {
                silent = true,
            })
            vim.keymap.set('n', '<C-A-p>', ":Telescope find_files hidden=true no_ignore=true<cr>", { silent = true })

            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { silent = true })
        end
    }
}
