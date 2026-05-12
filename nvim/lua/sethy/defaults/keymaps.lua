local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move line down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Move line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<C-c>", ":nohl<CR>")
vim.keymap.set("n", "Q", "<nops>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>")
-- Tabs
vim.keymap.set("n", "to", "<cmd>tabnew<CR>")   --open new tab
vim.keymap.set("n", "tx", "<cmd>tabclose<CR>") --close current tab
vim.keymap.set("n", "tn", "<cmd>tabn<CR>")     --go to next
vim.keymap.set("n", "tp", "<cmd>tabp<CR>")     --go to pre
vim.keymap.set("n", "tf", "<cmd>tabnew %<CR>") --open current tab in new tab

--split management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- split window vertically
vim.keymap.set("n", "sh", "<C-w>s", { desc = "Split window horizontally" })
-- split window horizontally
vim.keymap.set("n", "se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- close current split window
vim.keymap.set("n", "sx", "<cmd>close<CR>", { desc = "Close current split" })

