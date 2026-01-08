return {
    "mfussenegger/nvim-lint",
    config = function()
        require("lint").linters_by_ft = {
            css = { "biomejs" },
            html = { "biomejs" },
            javascript = { "biomejs" },
            javascriptreact = { "biomejs" },
            json = { "biomejs" },
            jsonc = { "biomejs" },
            typescript = { "biomejs" },
            typescriptreact = { "biomejs" },
        }

        -- Automatically lint on save
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = "*",
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
