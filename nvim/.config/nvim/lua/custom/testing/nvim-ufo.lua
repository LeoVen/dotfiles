return {
    -- Better folding
    {
        'kevinhwang91/nvim-ufo',
        event = 'BufRead',
        dependencies = {
            { 'kevinhwang91/promise-async' },
            {
                'luukvbaal/statuscol.nvim',
                config = function()
                    local builtin = require 'statuscol.builtin'
                    require('statuscol').setup {
                        -- foldfunc = "builtin",
                        -- setopt = true,
                        relculright = true,
                        segments = {
                            { text = { '%s' }, click = 'v:lua.ScSa' },
                            { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
                            { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
                        },
                    }
                end,
            },
        },
        config = function()
            -- Fold options
            vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
            vim.o.foldcolumn = '1'
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 999
            vim.o.foldenable = true

            require('ufo').setup()
        end,
    },
}
