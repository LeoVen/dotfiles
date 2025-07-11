return {
    {
        'ray-x/lsp_signature.nvim',
        event = 'InsertEnter',
        config = function()
            require('lsp_signature').setup {
                hint_enable = false,
                floating_window = true,
                handler_opts = {
                    border = 'single',
                },
            }
        end,
    },
}
