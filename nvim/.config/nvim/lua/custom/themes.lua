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
        priority = 1000,
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
    },
}
