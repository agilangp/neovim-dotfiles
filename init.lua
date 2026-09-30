vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.clipboard:append("unnamedplus")
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode with kj" })
vim.keymap.set("n", "<leader>ch", "<cmd>nohl<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Open Oil" })
vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<CR>", { desc = "Open Buffer Picker" })
vim.keymap.set("n", "<leader>d", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Open Diagnostics for Current File" })
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua files<CR>", { desc = "Open File Picker" })
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<CR>", { desc = "Open Live Grep" })
vim.keymap.set("n", "<Leader>g", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

vim.diagnostic.config({
	virtual_lines = true,
	signs = true, -- Show gutter signs
	underline = true, -- Underline problematic text
})

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/mfussenegger/nvim-lint" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/whoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/shaunsingh/nord.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/refractalize/oil-git-status.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/kylechui/nvim-surround", version = vim.version.range("4.x") },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
})

require("nvim-treesitter").install({ "lua", "javascript", "typescript", "fish" })
require("lint").linters_by_ft = {
	javascript = { "biomejs" },
	typescript = { "biomejs" },
}
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"ts_ls",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"emmet_ls",
		"prismals",
		"fish_lsp",
		"intelephense",
		"jsonls",
		"tombi",
		"marksman",
		"biome",
		"stylua",
	},
})
require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
	completion = { documentation = { auto_show = true } },
	signature = { enabled = true },
	keymap = {
		["<C-u>"] = { "scroll_signature_up", "fallback" },
		["<C-d>"] = { "scroll_signature_down", "fallback" },

		-- default in all keymap presets
		["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
	},
})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "biome" },
		typescript = { "biome" },
	},
})
require("oil").setup({
	win_options = {
		signcolumn = "yes:2",
	},
})
require("oil-git-status").setup()
require("ibl").setup()
require("which-key").setup({
	preset = "helix",
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim", "require" },
			},
		},
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter.start()
	end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	callback = function()
		vim.cmd("packadd nvim-autopairs")
		require("nvim-autopairs").setup({})
	end,
})

vim.cmd("colorscheme nord")
