return {
    -- See https://github.com/lukas-reineke/indent-blankline.nvim
    { -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        opts = {},
        config = function()
            -- Add configurations here
            require('ibl').setup {}
        end,
    },
}
