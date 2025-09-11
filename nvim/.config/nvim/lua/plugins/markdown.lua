return {
    -- Everything needed to improve the Markdown experience
    {
        -- Renders Markdown more nicely inside neovim
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
}
