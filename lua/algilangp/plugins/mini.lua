return {
	{
		"echasnovski/mini.notify",
		version = false,
		config = function()
			local notify = require("mini.notify")
			notify.setup()
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
