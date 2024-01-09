return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        
        require("dapui").setup({
            active = true,
            on_config_done = nil,
            breakpoint = {
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = "",
            },
            breakpoint_rejected = {
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = "",
            },
            stopped = {
                texthl = "DiagnosticSignWarn",
                linehl = "Visual",
                numhl = "DiagnosticSignWarn",
            },
            log = {
                level = "info",
            },
            ui = {
                auto_open = true,
                notify = {
                    threshold = vim.log.levels.INFO,
                },
                config = {
                    icons = { expanded = "", collapsed = "", circular = "" },
                    mappings = {
                        -- Use a table to apply multiple mappings
                        expand = { "<CR>", "<2-LeftMouse>" },
                        open = "o",
                        remove = "d",
                        edit = "e",
                        repl = "r",
                        toggle = "t",
                    },
                    -- Use this to override mappings for specific elements
                    element_mappings = {},
                    expand_lines = true,
                    layouts = {
                        {
                            elements = {
                                { id = "scopes",      size = 0.33 },
                                { id = "breakpoints", size = 0.17 },
                                { id = "stacks",      size = 0.25 },
                                { id = "watches",     size = 0.25 },
                            },
                            size = 0.33,
                            position = "right",
                        },
                        {
                            elements = {
                                { id = "repl",    size = 0.45 },
                            },
                            size = 0.27,
                            position = "bottom",
                        },
                    },
                    controls = {
                        enabled = true,
                        -- Display controls in this element
                        element = "repl",
                        icons = {
                            pause = "",
                            play = "",
                            step_into = "",
                            step_over = "",
                            step_out = "",
                            step_back = "",
                            run_last = "",
                            terminate = "",
                        },
                    },
                    floating = {
                        max_height = 0.9,
                        max_width = 0.5, -- Floats will be treated as percentage of your screen.
                        border = "rounded",
                        mappings = {
                            close = { "q", "<Esc>" },
                        },
                    },
                    windows = { indent = 1 },
                    render = {
                        max_type_length = nil, -- Can be integer or nil.
                        max_value_lines = 100, -- Can be integer or nil.
                    },
                },
            }
        })

        local dap, dapui = require("dap"), require("dapui")




        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        dap.adapters.node2 = {
            type = 'executable',
            command = 'node',
            args = { os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
        }

        vim.fn.sign_define("DapBreakpoint", {
                text = '',
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = "",
        })


        vim.fn.sign_define("DapBreakpointRejected", {
            text = '',
            texthl = "DiagnosticSignError",
            linehl = "",
            numhl = "",
        })
        vim.fn.sign_define("DapStopped", {
            text = "",
            texthl = "DiagnosticSignWarn",
            linehl = "Visual",
            numhl = "DiagnosticSignWarn",
        })

        


        vim.keymap.set("n", "<F9>", ":DapToggleBreakpoint<CR>", { silent = true })
        vim.keymap.set("n", "<F5>", ":DapContinue<CR>", { silent = true })
        vim.keymap.set("n", "<S-F5>", ":DapTerminate<CR>", { silent = true })
        vim.keymap.set("n", "<F10>", ":DapStepOver<CR>", { silent = true })
        vim.keymap.set("n", "<F11>", ":DapStepIn<CR>", { silent = true })
        vim.keymap.set("n", "<S-F11>", ":DapStepOut<CR>", { silent = true })


        vim.keymap.set("n", "<leader>do", ":lua require('dapui').open()<CR>", { silent = true })

        vim.keymap.set("n", "<leader>dc", ":lua require('dapui').close()<CR>", { silent = true })


        dap.configurations.typescript = {
            {
                -- For this to work you need to make sure the node process is started with the `--inspect` flag.
                name = 'Attach to process',
                type = 'node2',
                request = 'attach',
                processId = require 'dap.utils'.pick_process,
                cwd = "${workspaceFolder}",
                port = "9330",

            },
        }


        dap.configurations.javascript = {
            {
                -- For this to work you need to make sure the node process is started with the `--inspect` flag.
                name = 'Attach to process',
                type = 'node2',
                request = 'attach',
                processId = require 'dap.utils'.pick_process,
                cwd = "${workspaceFolder}",

            },
        }
    end,
}
