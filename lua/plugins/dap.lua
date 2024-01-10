return {
    "mfussenegger/nvim-dap",
    dependencies = {"rcarriga/nvim-dap-ui"},
    config = function()

        require("dapui").setup({
            controls = {
                enabled = true,
                element = "repl",
                icons = {
                    disconnect = " (Disconnect)",

                  pause = " (Pause)",
                  play = " (Play-F5)",
                  step_into = " (StepInto)",
                  step_over = " (StepOver)",
                  step_out = "(StepOut)",
                  step_back = " (StepBack)",
                  run_last = " (RunLast)",
                  terminate = " (Terminate)",

                },
              },
                    layouts = {
                        {
                          elements = {
                            { id = "scopes", size = 0.33 },
                            { id = "breakpoints", size = 0.17 },
                            { id = "stacks", size = 0.25 },
                            { id = "watches", size = 0.25 },
                          },
                          size = 0.30,
                          position = "right",
                        },
                        {
                          elements = {
                            { id = "repl", size = 1},
                          },
                          size = 0.30,
                          position = "bottom",
                        },
                      },
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
            args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'}
        }

        vim.fn.sign_define("DapBreakpoint", {
            text = '',
            texthl = "DiagnosticSignError",
            linehl = "",
            numhl = ""
        })

        vim.fn.sign_define("DapBreakpointRejected", {
            text = '',
            texthl = "DiagnosticSignError",
            linehl = "",
            numhl = ""
        })
        vim.fn.sign_define("DapStopped", {
            text = "",
            texthl = "DiagnosticSignWarn",
            linehl = "Visual",
            numhl = "DiagnosticSignWarn"
        })

        vim.api.nvim_create_autocmd("BufWinEnter", {
            callback = function()
                local buf_ft = vim.bo.filetype

                if buf_ft == "dapui_breakpoints" then
                    vim.cmd("setlocal winbar=\\ Breakpoints")

                end
                if buf_ft == "dapui_stacks" then
                    vim.cmd("setlocal winbar=\\\\ Stacks")
                end

                if buf_ft == "dapui_scopes" then
                    vim.cmd("setlocal winbar=\\\\ Scopes")
                end

                if buf_ft == "dapui_watches" then
                    vim.cmd("setlocal winbar=\\󰂥\\ Watches")
                end

              
            end
        })

        vim.keymap.set("n", "<F9>", ":DapToggleBreakpoint<CR>", {
            silent = true
        })
        vim.keymap.set("n", "<F5>", ":DapContinue<CR>", {
            silent = true
        })
        vim.keymap.set("n", "<S-F5>", ":DapTerminate<CR>", {
            silent = true
        })
        vim.keymap.set("n", "<F10>", ":DapStepOver<CR>", {
            silent = true
        })
        vim.keymap.set("n", "<F11>", ":DapStepIn<CR>", {
            silent = true
        })
        vim.keymap.set("n", "<S-F11>", ":DapStepOut<CR>", {
            silent = true
        })

        vim.keymap.set("n", "<leader>do", ":lua require('dapui').open()<CR>", {
            silent = true
        })

        vim.keymap.set("n", "<leader>dc", ":lua require('dapui').close()<CR>", {
            silent = true
        })

        dap.configurations.typescript = {{
            -- For this to work you need to make sure the node process is started with the `--inspect` flag.
            name = 'Attach to process',
            type = 'node2',
            request = 'attach',
            processId = require'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
            port = "9330"

        }}

        dap.configurations.javascript = {{
            -- For this to work you need to make sure the node process is started with the `--inspect` flag.
            name = 'Attach to process',
            type = 'node2',
            request = 'attach',
            processId = require'dap.utils'.pick_process,
            cwd = "${workspaceFolder}"

        }}
    end
}

