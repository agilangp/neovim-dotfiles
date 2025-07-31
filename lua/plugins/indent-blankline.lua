return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
        require("ibl").setup(
            {
                indent = { char = "┊" },
                scope = {
                    enabled = true,          -- enables the scope lines
                    show_start = true,       -- shows the start of the scope
                    show_end = false,        -- optional: shows the end of the scope
                    injected_languages = true, -- detects scopes in treesitter injected langs
                    highlight = { "Function", "Label" }, -- you can change highlight group
                },
                whitespace = { remove_blankline_trail = true },
                exclude = {
                    filetypes = {
                        "help",
                        "lazy",
                        "mason",
                        "which-key",
                    },
                    buftypes = { "terminal", "nofile" },
                },
            }
        )
    end
}
