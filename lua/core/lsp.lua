vim.lsp.enable({
	"ts_ls",
	"tailwindcss",
	"lua_ls",
	"emmet_ls",
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd([[set completeopt+=menuone,noselect,popup]])

vim.diagnostic.config({
	virtual_text = { current_line = true },
})
