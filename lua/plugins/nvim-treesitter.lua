-- Your nvim-treesitter config (e.g., in plugins/nvim-treesitter.lua)
return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "prisma",
                "markdown",
                "markdown_inline",
                "graphql",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "query",
                "vimdoc",
                "c",
                "php",
                "blade",
                "fish",
                "tmux"
            }, -- Add 'blade' here
            ignore_install = {},
            modules = {},
            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            -- Your other configurations for textobjects, etc.
        })

        -- Add the blade parser details
        require("nvim-treesitter.install").update({ with_info = true })

        -- Manual parser registration for blade
        require('nvim-treesitter.install').compilers.blade = {
            url = 'https://github.com/EmranMR/tree-sitter-blade',
            files = { 'src/parser.c' },
            branch = 'main',
        }

        -- Tell Neovim to treat .blade.php files as 'blade' filetype
        vim.filetype.add({
            pattern = {
                ['.*%.blade%.php'] = 'blade',
            },
        })
    end,
}
