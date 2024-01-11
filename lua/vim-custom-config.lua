vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set noshowmode")
vim.cmd("set laststatus=3")
vim.cmd("set noruler")
vim.cmd("set guicursor= ")

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.loader.enable()

vim.wo.number = true
vim.cmd("set hidden")

vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
        vim.lsp.buf.format()
    end
})

vim.o.autoread = true

vim.api.nvim_create_autocmd({"BufEnter", "CursorHold", "CursorHoldI", "FocusGained"}, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = {"*"}
})

vim.api.nvim_create_autocmd({"BufEnter", "CursorHold", "CursorHoldI", "FocusGained"}, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = {"*"}
})



vim.fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
    text = "",
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
    end,
})
