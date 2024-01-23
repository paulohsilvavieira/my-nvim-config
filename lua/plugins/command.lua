
return {
  'VonHeikemen/fine-cmdline.nvim',
  dependencies = {'MunifTanjim/nui.nvim'},
  config=function()
    vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', { noremap = true, silent = true })
    require('fine-cmdline').setup({
      cmdline = {
        enable_keymaps = true,
        smart_history = true,
        prompt = 'RUN: '
      },
      popup = {
        position = {
          row = '30%',
          col = '50%',
        },
        size = {
          width = '50%',
        },
        border = {
          style = 'rounded',
        },
        win_options = {
          winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
        },
      },
     
    })
  end
}