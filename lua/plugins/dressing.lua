return {
   'stevearc/dressing.nvim',
  opts = {},
  config=function()
    require('dressing').setup({
      select = {},
      telescope = nil,

    })
  end
}