return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install({
            "javascript",
            "typescript",
            "tsx",
            "prisma",
            "lua",
            "fish",
            "json",
            "html",
            "css",
            "bash",
            "yaml",
            "toml",
            "markdown",
            "php",
            "http",
            "tmux",
            "vim",
            "json",
            "jsonc",
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "<filetype>" },
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
