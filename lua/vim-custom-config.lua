vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set noshowmode")
vim.cmd("set noruler")
vim.cmd("set guicursor= ")
vim.cmd("set wrap linebreak")
vim.cmd("set hidden")
vim.cmd("set cursorline")

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.mousemoveevent = true
vim.o.termguicolors = true
vim.loader.enable()

vim.wo.number = true

vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
        vim.lsp.buf.format()
    end
})

vim.o.autoread = true


vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" }
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

local _border = "rounded"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = _border
    }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = _border
    }
)

vim.diagnostic.config {
    float = { border = _border }
}


vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
vim.api.nvim_create_autocmd("User", {

    pattern = "BDeletePre *",
    group = "alpha_on_empty",
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local name = vim.api.nvim_buf_get_name(bufnr)

        if name == "" then
            vim.cmd([[:Alpha | bd#]])
        end
    end,
})
