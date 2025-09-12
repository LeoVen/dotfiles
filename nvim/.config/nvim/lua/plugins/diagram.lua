return {
    -- npx puppeteer browsers install chrome-headless-shell
    {
        '3rd/diagram.nvim',
        dependencies = {
            -- Already setup elsewhere
            -- '3rd/image.nvim',
        },
        opts = {
            -- Disable automatic rendering for manual-only workflow
            events = {
                render_buffer = {}, -- Empty = no automatic rendering
                clear_buffer = { 'BufLeave' },
            },
            renderer_options = {
                mermaid = {
                    theme = 'dark',
                    scale = 2,
                },
            },
        },
        keys = {
            {
                '<leader>mm',
                function()
                    require('diagram').show_diagram_hover()
                end,
                mode = 'n',
                ft = { 'markdown' }, -- Only in these filetypes
                desc = 'Show diagram in new tab',
            },
        },
    },
}
