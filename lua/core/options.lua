local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.list = true
opt.listchars = {
    space = '.',
}

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false

opt.syntax = "on"

vim.o.shell = "powershell.exe"
vim.o.winborder = "rounded"
vim.o.completeopt = "menuone,noinsert,noselect,preview"

vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 1
