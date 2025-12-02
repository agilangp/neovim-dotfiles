return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            -- list of servers for mason to install
            ensure_installed = {
                "ts_ls",
                "html",
                "cssls",
                "tailwindcss",
                "lua_ls",
                "emmet_ls",
                "prismals",
                "fish_lsp",
                "intelephense",
                "jsonls",
                "tombi",
                "markdown_oxide",
            },
        },
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗",
                        },
                    },
                },
            },
            {
                "neovim/nvim-lspconfig",
                config = function()
                    vim.lsp.config("*", {
                        capabilities = require("blink.cmp").get_lsp_capabilities(),
                    })
                end,
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "prettierd", -- prettier formatter
                "stylua", -- lua formatter
                "eslint_d",
            },
            automatic_installation = true,
            run_on_start = true,
        },
        dependencies = {
            "williamboman/mason.nvim",
        },
    },
}
