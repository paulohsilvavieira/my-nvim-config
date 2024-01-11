return {
  
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {  "nvim-telescope/telescope-dap.nvim"    },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require("telescope").setup({

        extensions = {
          "fzf",
          "dap"
        },
      })
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("dap")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", ":Telescope find_files<cr>", {
        silent = true,
      })
      vim.keymap.set("n", "<C-S-p>", ":Telescope find_files hidden=true no_ignore=true<cr>", { silent = true })

      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { silent = true })
    end,
  },
}
