return {
    "mfussenegger/nvim-lint",
    config = function()
        require("lint").linters_by_ft = {
            css = { "biome" },
            html = { "biome" },
            javascript = { "biome" },
            javascriptreact = { "biome" },
            json = { "biome" },
            jsonc = { "biome" },
            typescript = { "biome" },
            typescriptreact = { "biome" },
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
