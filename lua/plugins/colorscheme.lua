-- return {
--     "scottmckendry/cyberdream.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.cmd("colorscheme cyberdream")
--     end,
--
-- }

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
        vim.cmd('colorscheme base16-onedark-dark')
    end
}
