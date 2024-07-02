return {

    -- {
    --     'maxmx03/dracula.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         local dracula = require "dracula"

    --         dracula.setup({})
    --         vim.cmd.colorscheme 'dracula'
    --     end
    -- },


    {
        "navarasu/onedark.nvim",
        lazy = false,
        name = "onedark",
        priority = 1000,
        config = function()
            require('onedark').setup {
                style = 'dark',
            }
            require('onedark').load()
            vim.cmd.colorscheme 'onedark'
        end
    }
}
