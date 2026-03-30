-- return {
--     "navarasu/onedark.nvim",
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--         require('onedark').setup {
--             style = 'darker'
--         }
--         -- Enable theme
--         require('onedark').load()
--     end
-- }

return {
    "RRethy/base16-nvim",
    config = function()
        -- vim.cmd("colorscheme base16-nord")
        vim.cmd("colorscheme base16-material-darker")
        -- vim.cmd("colorscheme base16-ashes")
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
--     "webhooked/kanso.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.cmd("colorscheme kanso")
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
--         vim.cmd("colorscheme onedark_dark")
--     end,
-- }

-- return {
--     "AlexvZyl/nordic.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("nordic").load()
--     end,
-- }
