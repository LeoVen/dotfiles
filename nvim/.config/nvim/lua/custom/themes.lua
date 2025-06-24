return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'catppuccin-mocha'
        end,
    },
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins.
    },
}
