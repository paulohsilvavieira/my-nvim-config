local opts = { noremap = true, silent = true }


vim.keymap.set('n', '<C-s>', ':silent! w<CR>', { silent = true })


vim.keymap.set('n', '<C-w>', ':silent! BufDel<CR>', { noremap = true, silent = true })


vim.keymap.set('n', '<A-k>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', '<A-j>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.keymap.set('t', '<ESC>', "<C-\\><C-n><C-w>h", { silent = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })




vim.api.nvim_create_autocmd(
    { "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
        callback = function()
            local buf_ft = vim.bo.filetype
            if buf_ft == "NvimTree" or buf_ft == "toggleterm" then
                vim.keymap.set("n", "<S-Up>", ":resize +2<CR>", opts)
                vim.keymap.set("n", "<S-Down>", ":resize -2<CR>", opts)
                vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", opts)
                vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", opts)
                return
            end
            if buf_ft ~= "NvimTree" and buf_ft ~= "toggleterm" then
                vim.keymap.set("n", "<S-Up>", ":resize -2<CR>", opts)
                vim.keymap.set("n", "<S-Down>", ":resize +2<CR>", opts)
                vim.keymap.set("n", "<S-Left>", ":vertical resize +2<CR>", opts)
                vim.keymap.set("n", "<S-Right>", ":vertical resize -2<CR>", opts)
                return
            end
        end,
    })


vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
