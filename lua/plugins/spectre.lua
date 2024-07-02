return {
    "nvim-pack/nvim-spectre",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require('spectre').setup()
    end

}
