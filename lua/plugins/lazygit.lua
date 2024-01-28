return {

    "kdheepak/lazygit.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()

    end,
    keys = {
        { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open a lazygit" }
    },
}
