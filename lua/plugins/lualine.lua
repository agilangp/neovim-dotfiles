return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto", -- "auto" will set the theme dynamically based on the colorscheme
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    "branch",
                    {
                        "diff",
                        colored = true, -- Displays a colored diff status if set to true
                        diff_color = {
                            -- Same color values as the general color option can be used here.
                            added = "LuaLineDiffAdd",           -- Changes the diff's added color
                            modified = "LuaLineDiffChange",     -- Changes the diff's modified color
                            removed = "LuaLineDiffDelete",      -- Changes the diff's removed color you
                        },
                        symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff.
                        source = nil,                           -- A function that works as a data source for diff.
                        -- It must return a table as such:
                        --   { added = add_count, modified = modified_count, removed = removed_count }
                        -- or nil on failure. count <= 0 won't be displayed.
                    },
                    {
                        "diagnostics",

                        -- Table of diagnostic sources, available sources are:
                        --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                        -- or a function that returns a table as such:
                        --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                        sources = { "nvim_diagnostic", "coc" },

                        -- Displays diagnostics for the defined severity types
                        sections = { "error", "warn", "info", "hint" },

                        diagnostics_color = {
                            -- Same values as the general color option can be used here.
                            error = "DiagnosticError", -- Changes diagnostics' error color.
                            warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
                            info = "DiagnosticInfo", -- Changes diagnostics' info color.
                            hint = "DiagnosticHint", -- Changes diagnostics' hint color.
                        },
                        symbols = { error = "", warn = "", info = "", hint = "" },
                        colored = true, -- Displays diagnostics status in color if set to true.
                        update_in_insert = false, -- Update diagnostics in insert mode.
                        always_visible = true, -- Show diagnostics even if there are none.
                    },
                },
                lualine_c = { { "filename", path = 3 } },
                lualine_x = {
                    {
                        "lsp_status",
                        icon = "", -- f013
                        symbols = {
                            -- Standard unicode symbols to cycle through for LSP progress:
                            spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
                            -- Standard unicode symbol for when LSP is done:
                            done = "✓",
                            -- Delimiter inserted between LSP names:
                            separator = " ",
                        },
                        -- List of LSP names to ignore (e.g., `null-ls`):
                        ignore_lsp = {},
                    },
                    "encoding",
                    "filetype",
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
