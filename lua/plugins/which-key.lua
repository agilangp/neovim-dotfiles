return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = 'helix',
        spec = {
            { "<leader>b", group = "Buffer" },
            { "<leader>c", group = "Code" },
            { "<leader>f", group = "Find" },
            { "<leader>g", group = "Git" },
            { "<leader>l", group = "LSP" },
            { "<leader>s", group = "Split" },
        }
    },
    keys = {
        { "<leader>fb", "<cmd>FzfLua buffers<cr>",   desc = "Find Buffers" },
        { "<leader>ff", "<cmd>FzfLua files<cr>",     desc = "Find Files" },
        { "<leader>fs", "<cmd>FzfLua live_grep<cr>", desc = "Find Strings" }
    }
}
