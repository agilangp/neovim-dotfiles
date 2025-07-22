return {
	{
		-- "rebelot/kanagawa.nvim",
		-- "olimorris/onedarkpro.nvim",
		-- "nyoom-engineering/oxocarbon.nvim",
		"scottmckendry/cyberdream.nvim",
		priority = 1000,
		config = function()
			-- require("onedarkpro").setup({
			-- 	options = {
			-- 		transparency = true,
			-- 		cursorline = true,
			-- 	},
			-- })
			-- vim.cmd([[colorscheme kanagawa]])
			-- vim.cmd([[colorscheme onedark_dark]])
			-- vim.cmd([[colorscheme oxocarbon]])
			vim.cmd([[colorscheme cyberdream]])
		end,
	},
}
