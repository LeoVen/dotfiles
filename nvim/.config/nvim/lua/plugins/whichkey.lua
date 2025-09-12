return {
    { -- Useful plugin to show you pending keybinds.
        'folke/which-key.nvim',
        event = 'VimEnter', -- Sets the loading event to 'VimEnter'
        config = function() -- This is the function that runs, AFTER loading
            require('which-key').setup()

            require('which-key').add {
                {
                    { '<leader>c', '[C]ode' },
                    { '<leader>d', '[D]ocument' },
                    { '<leader>r', '[R]ename' },
                    { '<leader>s', '[S]earch' },
                    { '<leader>w', '[W]orkspace' },
                    { '<leader>t', '[T]oggle' },
                    { '<leader>h', 'Git [H]unk' },
                    { '<leader>o', '[O]bsidian' },
                },
                {
                    mode = 'v',
                    { '<leader>h', 'Git [H]unk' },
                },
            }

            require('which-key').add {}
        end,
    },
}
