return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup {
            options = {
                mode = 'buffers',
                diagnostics = "nvim_lsp",
                separator_style = { "", "" },
                modified_icon = '●',
                show_close_icon = true,
                show_tab_indicators = true,
                left_trunc_marker = "",
                right_trunc_marker = "",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "Explorer",
                        highlight = "",
                        separator = true,
                    },
                },

            }
        }
        vim.api.nvim_create_autocmd({"BufWinEnter", "BufEnter", "VimEnter", "CursorHold", "CursorHoldI", "FocusGained"}, {
            callback = function()
                local buf_ft = vim.bo.filetype
                if buf_ft == "alpha" then
                    vim.cmd("hi BufferLineFill guibg='NONE'")
                    vim.cmd("set termguicolors")   
                    return 
                end

                if buf_ft ~= "alpha" then
                    vim.cmd("hi BufferLineFill guibg='#13161f'")
                    vim.cmd("set termguicolors")
                    return               
                end

               
                        
            end
        })
    end


}
