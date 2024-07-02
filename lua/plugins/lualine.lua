return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'arkav/lualine-lsp-progress', 'seblj/nvim-tabline' },
    config = function()
        local function diff_source()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
                return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                }
            end
        end
        require('lualine').setup {
            options = {
                theme = vim.g.colors_name,
                --             refresh = {
                --                 statusline = 1000,
                --             },
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

                lualine_c = {
                    { "diff",
                        source = diff_source,
                        symbols = {
                            added = " ",
                            modified = " ",
                            removed = " ",
                        },
                        padding = { left = 2, right = 1 },
                        diff_color = {
                            added = { fg = "#98be65" },
                            modified = { fg = "#ECBE7B" },
                            removed = { fg = "#ec5f67" },
                        },
                        cond = nil,
                    }
                },
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
