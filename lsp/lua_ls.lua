return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }, -- this line removes "undefined global 'vim'" warning
			},
		},
	},
}
