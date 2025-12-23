return {
    {
        -- Useful status updates for LSP.
        'j-hui/fidget.nvim',
        config = function()
            -- See :h fidget-options
            require('fidget').setup {}
        end,
    },
}
