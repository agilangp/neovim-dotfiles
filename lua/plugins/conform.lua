return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                css = { "biome" },
                html = { "biome" },
                javascript = { "biome" },
                javascriptreact = { "biome" },
                json = { "biome" },
                jsonc = { "biome" },
                lua = { "stylua" },
                typescript = { "biome" },
                typescriptreact = { "biome" },
            },
        })

        -- Automatically format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function()
                require("conform").format({ async = false })
            end,
        })

        -- Add vim keymap to format manually
        vim.keymap.set("n", "<leader>lf", function()
            require("conform").format({ async = false, fallback = false })
        end, { desc = "Format current buffer" })
    end,
}
