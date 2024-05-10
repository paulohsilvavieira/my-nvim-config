return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup{
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        refactor = {
          smart_rename = {
            enable = true,
            -- keymaps = {
            --   smart_rename = "grr",
            -- },
          },
        },
      }
    end
  }
}
