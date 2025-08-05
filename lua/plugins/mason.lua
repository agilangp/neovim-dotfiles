return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = { "lua_ls", "ts_ls", "tailwindcss", "emmet_ls", "intelephense" },
    },
    dependencies = {
        "neovim/nvim-lspconfig",
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
        require("mason-lspconfig").setup()
        require("mason-tool-installer").setup({
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "tailwindcss",
                "emmet_ls",
                "intelephense",
            },
            automatic_installation = true,
            run_on_start = true,
        })
    end,
}
