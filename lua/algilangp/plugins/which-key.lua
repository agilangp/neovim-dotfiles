return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		spec = {
			{ "<leader>c", group = "Code action" },
			{ "<leader>e", group = "Explorer" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>m", group = "Format" },
			{ "<leader>n", group = "Session" },
			{ "<leader>r", group = "LSP" },
			{ "<leader>s", group = "Split" },
			{ "<leader>x", group = "Trouble" },
		},
	},
}
