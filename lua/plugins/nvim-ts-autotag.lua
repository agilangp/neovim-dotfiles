return {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    options = {},
    config = function()
        require('nvim-ts-autotag').setup()
    end
}
