return {
    { "folke/neodev.nvim" },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({
                ensure_installed = {
                    "tsserver",
                    "tailwindcss-language-server",
                    "eslint_d",
                }
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,

        opts = {
            auto_install = true,
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "tsserver",
                }
            })
        end
    },

    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local attach = function(_, _)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
                vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
                vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
                vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", {})
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
                vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {})
                vim.keymap.set("n", "<leader>gk", vim.lsp.buf.hover, {})
            end
            require("neodev").setup({
                -- add any options here, or leave empty to use the default settings
            })
            local lspconfig = require("lspconfig")




            lspconfig.tsserver.setup({
                capabilities = capabilities,
                on_attach = attach,
                -- handlers = handlers
            })
            lspconfig.html.setup({
                capabilities = capabilities,
                on_attach = attach,
                -- handlers = handlers
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = attach,
                -- handlers = handlers
            })
            lspconfig.tailwindcss.setup({
                -- capabilities = capabilities,
                on_attach = attach,
                -- handlers = handlers,
                falseroot_dir = function(...)
                    return require("lspconfig.util").root_pattern(".git")(...)
                end
            })

            lspconfig.cssls.setup({
                capabilities = capabilities,
                on_attach = attach,
                -- handlers = handlers
            })





            vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
            vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
            vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
            vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
        end,
    },
}
