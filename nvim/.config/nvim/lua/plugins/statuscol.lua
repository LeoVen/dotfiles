return {
    {
        -- Custom statuscolumn
        'luukvbaal/statuscol.nvim',
        config = function()
            local builtin = require 'statuscol.builtin'

            require('statuscol').setup {
                relculright = true,
                segments = {
                    { text = { builtin.lnumfunc }, click = 'v:lua.ScLa' },
                    { text = { ' ', '%s' }, click = 'v:lua.ScSa' },
                    { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
                },
            }
        end,
    },
}
