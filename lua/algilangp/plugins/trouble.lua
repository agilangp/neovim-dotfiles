return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = function(_, opts)
		return vim.tbl_deep_extend("force", opts or {}, {
			picker = {
				actions = require("trouble.sources.snacks").actions,
				win = {
					input = {
						keys = {
							["<c-t>"] = {
								"trouble_open",
								mode = { "n", "i" },
							},
						},
					},
				},
			},
		})
	end,
	cmd = "Trouble",
	keys = {
		{ "<leader>dw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
		{
			"<leader>dd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Open trouble document diagnostics",
		},
		{ "<leader>dq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
		{ "<leader>dl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
		--    { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
	},
}
