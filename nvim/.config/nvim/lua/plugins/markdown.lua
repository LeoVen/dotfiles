return {
    -- Everything needed to improve the Markdown experience
    {
        -- Renders Markdown more nicely inside neovim
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            code = {
                border = 'thick',
            },
            link = {
                custom = {
                    web = { pattern = '^http', icon = '󰖟 ' },
                    discord = { pattern = 'discord%.com', icon = '󰙯 ' },
                    github = { pattern = 'github%.com', icon = '󰊤 ' },
                    gitlab = { pattern = 'gitlab%.com', icon = '󰮠 ' },
                    google = { pattern = 'google%.com', icon = '󰊭 ' },
                    neovim = { pattern = 'neovim%.io', icon = ' ' },
                    reddit = { pattern = 'reddit%.com', icon = '󰑍 ' },
                    stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
                    wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
                    youtube = { pattern = 'youtube%.com', icon = '󰗃 ' },
                    aws = { pattern = 'aws%.amazon%.com', icon = ' ' },
                },
            },
        },
    },
}
