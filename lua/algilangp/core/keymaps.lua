vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode with kj" })

keymap.set("n", "<leader>ch", ":nohl<CR>", { desc = "clear search highlights" })

keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>v", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tn", "<cmd>bn<CR>", { desc = "Go to next tab" }) -- close current tab
keymap.set("n", "<leader>tl", "<cmd>bp<CR>", { desc = "Go to previous tab" }) -- close current tab
keymap.set("n", "<leader>tx", "<cmd>bd<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
