require('Comment').setup()
require('nvim-autopairs').setup()
require('fidget').setup({})
require('ibl').setup()
require('quicker').setup({
    keys = {
        {
            '>',
            function()
                require('quicker').expand({ before = 4, after = 4, add_to_existing = true })
            end,
            desc = 'Expand quickfix context',
        },
        {
            '<',
            function()
                require('quicker').collapse()
            end,
            desc = 'Collapse quickfix context',
        },
    },
})
vim.keymap.set('n', '<leader>qq', function()
    require('quicker').toggle()
end, {
    desc = 'Toggle quickfix',
})
vim.keymap.set('n', '<leader>l', function()
    require('quicker').toggle({ loclist = true })
end, {
    desc = 'Toggle loclist',
})

require('lazydev').setup({
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
        library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            { path = 'snacks.nvim', words = { 'Snacks' } },
        },
    },
})
