return {
    {
        'stevearc/oil.nvim',
        dependencies = { { 'echasnovski/mini.icons', opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
        config = function()
            require('oil').setup {
                columns = {
                    'icon',
                    -- 'permissions',
                    -- 'size',
                    -- 'mtime',
                },
                use_default_keymaps = false,
                view_options = {
                    show_hidden = true,
                },
                float = {
                    max_width = 0.8,
                    max_height = 0.8,
                },
                keymaps = {
                    -- TODO: adjust mappings
                    ['-'] = { 'actions.close', mode = 'n' },
                    ['g?'] = { 'actions.show_help', mode = 'n' },
                    ['<CR>'] = 'actions.select',
                    ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
                    ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
                    ['<C-t>'] = { 'actions.select', opts = { tab = true } },
                    ['<C-p>'] = 'actions.preview',
                    ['<C-l>'] = 'actions.refresh',
                    ['^'] = { 'actions.parent', mode = 'n' },
                    ['_'] = { 'actions.open_cwd', mode = 'n' },
                    ['`'] = { 'actions.cd', mode = 'n' },
                    ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
                    ['gs'] = { 'actions.change_sort', mode = 'n' },
                    ['gx'] = 'actions.open_external',
                    ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
                    ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
                },
            }

            vim.keymap.set('n', '-', '<cmd>Oil --float<cr>', { desc = 'Open Oil' })
        end,
    },
}
