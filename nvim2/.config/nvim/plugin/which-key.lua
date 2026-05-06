local wk = require('which-key')
wk.setup({
    preset = 'helix',
})
wk.add({
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
})
