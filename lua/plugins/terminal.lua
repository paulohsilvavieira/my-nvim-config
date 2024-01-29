return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup()
        end,
        keys = {
            { "<leader>th", "<cmd>ToggleTerm size=20 direction=horizontal<cr>", desc = "Open a horizontal terminal" },
            { "<leader>tf", "<cmd>ToggleTerm size=20 direction=float<cr>", desc = "Open a float terminal" },
            { "<leader>tv", "<cmd>ToggleTerm size=20 direction=vertical<cr>", desc = "Open a vertical terminal" }

        },
    }
}
