

return {
  'akinsho/bufferline.nvim',
   version = "*",
   dependencies = 'nvim-tree/nvim-web-devicons',
   config=function()

    require("bufferline").setup{
      options = {
        mode = 'buffers',
        diagnostics = "nvim_lsp",
        separator_style = {"", ""},
        modified_icon = '●',
        show_close_icon = true,
        show_tab_indicators = true,
        left_trunc_marker = "",
        right_trunc_marker = "",
        offsets = {
          {
              filetype = "NvimTree",
              text="File Explorer",
              highlight="Directory",
              separator= true,
          },
        },

      }
    }
   end


}
