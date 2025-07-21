vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode with kj" })

keymap.set("n", "<leader>ch", ":nohl<CR>", { desc = "clear search highlights" })

keymap.set("n", "x", '"_x')

-- split management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- navigating
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- buffer management
keymap.set("n", "L", "<cmd>bn<CR>", { desc = "Go to next buffer" })
keymap.set("n", "H", "<cmd>bp<CR>", { desc = "Go to previous buffer" })
keymap.set("n", "<leader>bo", "<cmd>tabnew<CR>", { desc = "Open new buffer" })
keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close current buffer" })
keymap.set("n", "<leader>bn", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new buffer" })

-- netrw
keymap.set("n", "<leader>e", "<cmd>25Lexplore!<CR>", { desc = "Toggle Explore" })
