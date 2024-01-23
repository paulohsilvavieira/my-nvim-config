return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    
    opts = {
      auto_install = true,
    },
    config=function()
      require("mason-lspconfig").setup({
        ensure_installed={ "tsserver"}
      })
    end
  },
   
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local attach= function(_,_)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
        vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", {})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {})
      end
      local lspconfig = require("lspconfig")

      
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach=attach
      })
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach=attach
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach=attach
      })

     


      vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
      vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
      vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
    end,
  },
}
