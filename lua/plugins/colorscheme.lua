return {
    "RRethy/base16-nvim",
    config = function()
        vim.cmd("colorscheme base16-oxocarbon-dark")
    end,
}

-- return {
--     "Mofiqul/adwaita.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.g.adwaita_darker = true -- for darker version
--         vim.g.adwaita_disable_cursorline = true -- to disable cursorline
--         vim.cmd([[colorscheme adwaita]])
--     end,
-- }

-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {},
--     config = function()
--         vim.cmd("colorscheme tokyonight-night")
--     end,
-- }

-- return {
--     "olimorris/onedarkpro.nvim",
--     priority = 1000, -- Ensure it loads first
--     config = function()
--         vim.cmd("colorscheme onedark")
--     end,
-- }
