return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup {
            signs = {
                add       = { hl = "GitSignsAdd", text = '', },
                change    = { hl = "GitSignsChange", text = '', },
                delete    = { hl = "GitSignsDelete", text = '' },
                untracked = { text = '' },
            },
            signcolumn = true
        }

        vim.cmd("hi GitSignsAdd guifg=#d2ebbe")
        vim.cmd("hi GitSignsChange guifg=#ECBE7B")
    end
}
