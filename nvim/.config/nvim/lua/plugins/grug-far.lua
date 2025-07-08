return {
    {
        'MagicDuck/grug-far.nvim',
        -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
        -- additional lazy config to defer loading is not really needed...
        config = function()
            -- optional setup call to override plugin options
            -- alternatively you can set options with vim.g.grug_far = { ... }
            require('grug-far').setup {
                -- options, see Configuration section below
                -- there are no required options atm
            }

            vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>GrugFar<CR>', { desc = '[G]rug [F]ar (find and replace)' })

            -- Launch with the current word under the cursor as the search string
            vim.api.nvim_set_keymap(
                'v',
                '<leader>gf',
                [[:<C-u>lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })<CR>]],
                { desc = '[G]rug [F]ar (search selection)' }
            )
        end,
    },
}
