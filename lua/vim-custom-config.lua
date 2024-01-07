vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set noshowmode")
vim.cmd("set laststatus=3")

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true })

vim.loader.enable()

vim.wo.number = true
vim.cmd("set hidden")

vim.keymap.set('n', '<C-w>', ':BufDel<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
        vim.lsp.buf.format()
    end
})
vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-k>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-j>', ':m .-2<CR>==', { noremap = true, silent = true })
