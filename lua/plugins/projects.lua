
return {
  "ahmedkhalf/project.nvim",
  opts = {
    manual_mode = true,
  },
  event = "VeryLazy",
  config = function(_, opts)
    require("project_nvim").setup({})
    require('telescope').load_extension('projects')


  end,
 
  vim.keymap.set("n", "<leader>fp", "<Cmd>Telescope projects<CR>", {silent=true})

}