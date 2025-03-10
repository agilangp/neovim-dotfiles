return {
	{
		"echasnovski/mini.ai",
		version = "*",
		config = function()
			local ai = require("mini.ai")
			ai.setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = "*",
		event = "VeryLazy",
		config = function()
			local pairs = require("mini.pairs")
			pairs.setup({
				modes = { insert = true, command = true, terminal = false },
				-- skip autopair when next character is one of these
				skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
				-- skip autopair when the cursor is inside these treesitter nodes
				skip_ts = { "string" },
				-- skip autopair when next character is closing pair
				-- and there are more closing pairs than opening pairs
				skip_unbalanced = true,
				-- better deal with markdown code blocks
				markdown = true,
			})
		end,
	},
	{
		"echasnovski/mini.jump2d",
		version = "*",
		config = function()
			local jump2d = require("mini.jump2d")
			jump2d.setup()
		end,
	},
}
