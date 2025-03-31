-- Database interactions
return {
    'tpope/vim-dadbod',
    'kristijanhusak/vim-dadbod-completion',
    {
        'kristijanhusak/vim-dadbod-ui',
        init = function()
            vim.keymap.set('n', '<space>db', ':DBUI<CR>', { desc = 'Open DBUI' })
        end,
    },
}
