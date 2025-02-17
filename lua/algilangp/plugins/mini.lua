return {
	{
		"echasnovski/mini.indentscope",
		version = false,
		config = function()
			local indentscope = require("mini.indentscope")
			indentscope.setup()
		end,
	},
	{
		"echasnovski/mini.ai",
		version = false,
		config = function()
			local ai = require("mini.ai")
			ai.setup()
		end,
	},
}
