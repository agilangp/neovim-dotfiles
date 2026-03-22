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
            "html",
            "css",
            "bash",
            "yaml",
            "toml",
            "markdown",
            "markdown_inline",
            "php",
            "http",
            "tmux",
            "vim",
            "json",
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "<filetype>" },
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
