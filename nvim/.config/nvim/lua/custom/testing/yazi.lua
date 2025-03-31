return {
    {
        'mikavilpas/yazi.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        event = 'VeryLazy',
        keys = {
            {
                -- Open in the current working directory
                '<leader>cw',
                function()
                    require('yazi').yazi(nil, vim.fn.getcwd())
                end,
                desc = 'Yazi in Current Directory',
            },
        },
        opts = {
            open_for_directories = false,
        },
    },
}
