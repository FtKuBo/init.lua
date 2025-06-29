vim.g.mapleader = " "
vim.keymap.set('n', '<leader>ff', function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>eo", vim.cmd.NvimTreeOpen)
vim.keymap.set("n", "<leader>ec", vim.cmd.NvimTreeClose)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- make a file executable

vim.keymap.set("n", "<leader>s", function()
    vim.cmd("w")
end)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
