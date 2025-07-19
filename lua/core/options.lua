local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = true

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

vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
-- vim.g.netrw_altv = 1
vim.g.netrw_banner = 0
