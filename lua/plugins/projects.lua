
return {
  "ahmedkhalf/project.nvim",

  event = "VeryLazy",
  config = function(_, opts)
    require("project_nvim").setup({})
    require('telescope').load_extension('projects')
  end,
  vim.keymap.set("n", "<leader>fp", ":lua require('telescope').extensions.projects.projects(require('telescope.themes').get_dropdown{previewer = false})<CR>", {silent=true, desc='Find Projects'})

}