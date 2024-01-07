return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'arkav/lualine-lsp-progress', 'seblj/nvim-tabline' },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                component_separators = '',
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    'NVimTree'
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {
                    { 'mode', icons_enabled = true, icon = '', right_padding = 1, separator = { right = '' } },

                },
                lualine_b = {
                    { 'branch', icons_enabled = true, icon = '' },
                    {
                        'diagnostics',
                        sources = { "nvim_diagnostic" },
                        always_visible = true,
                        sections = { 'error', 'warn' },
                        symbols = { error = '󰅙 ', warn = ' ', }

                    },

                },
                lualine_c = {},
                lualine_x = {
                    { 'lsp_progress',
                        display_components = { 'lsp_client_name', { 'title', 'percentage' } } }
                },
                lualine_y = {
                    'filetype', 'progress',
                    { 'location', separator = { left = '' }, left_padding = 2 },
                },
                lualine_z = {
                    { 'datetime', style = "%d/%m - %H:%M", icons_enabled = true, icon = '󰥔' }
                },

            },
        }
    end
}
