return {
    {
        'zaldih/themery.nvim',
        lazy = false,
        config = function()
            require('themery').setup {
                themes = { 'catppuccin', 'tokyonight' },
                livePreview = true,
            }
        end,
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'catppuccin'
        end,
    },
    {
        'folke/tokyonight.nvim',
        priority = 1000, -- make sure to load this before all the other start plugins.
        init = function()
            -- such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
            vim.cmd.colorscheme 'tokyonight-night'
            -- you can configure highlights by doing something like:
            vim.cmd.hi 'comment gui=none'
        end,
    },
}
