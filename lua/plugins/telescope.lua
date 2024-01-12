return {
  
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    
    config = function()
      require("telescope").setup({
       
        extensions = {
          "fzf",
        },
        defaults = {
          layout_strategy = "vertical",
          layout_config = {
            height = 0.95,
            prompt_position = 'top',
          },
      },
      pickers = {
          find_files = {
              hidden = true,
              theme='dropdown'
          },
      },
      })
      require("telescope").load_extension("fzf")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false })<cr>", {
        silent = true,
      })
      vim.keymap.set("n", "<S-p>", ":Telescope find_files hidden=true no_ignore=true<cr>", { silent = true })

      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { silent = true })
    end,
  },
}
