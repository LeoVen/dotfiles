return {
    {
        'nvzone/floaterm',
        dependencies = 'nvzone/volt',
        config = function()
            require('floaterm').setup {
                border = false,
                size = {
                    h = 80,
                    w = 80,
                },
            }
            vim.keymap.set({ 'n', 't' }, '\\', '<CMD>FloatermToggle<CR>', { desc = 'Floaterm Toggle' })
        end,
    },
}
