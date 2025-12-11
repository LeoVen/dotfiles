return {
    { -- Collection of various small independent plugins/modules
        'echasnovski/mini.nvim',
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [']quote
            --  - ci'  - [C]hange [I]nside [']quote
            require('mini.ai').setup { n_lines = 500 }

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require('mini.surround').setup()

            -- Move any selection in any direction
            --
            -- Press Alt (Meta) + hjkl to move the selected lines/blocks/characters
            require('mini.move').setup()

            -- Split and join arguments
            --
            -- gS - toggle split/join
            require('mini.splitjoin').setup { mappings = { toggle = 'gS' } }

            require('mini.bufremove').setup()

            vim.keymap.set('n', '<leader>bD', function()
                require('mini.bufremove').delete(0, true)
            end, { desc = '[B]uffer [D]elete (Force)' })

            -- ... and there is more!
            --  Check out: https://github.com/echasnovski/mini.nvim
        end,
    },
}
