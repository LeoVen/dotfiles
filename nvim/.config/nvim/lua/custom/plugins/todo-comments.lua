return {
    -- Highlight todo, notes, etc in comments
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local todo_comments = require 'todo-comments'
            todo_comments.setup { signs = false }

            vim.keymap.set('n', ']t', function()
                todo_comments.jump_next()
            end, { desc = 'Next [T]odo Comment' })
            vim.keymap.set('n', '[t', function()
                todo_comments.jump_prev()
            end, { desc = 'Previous [T]odo Comment' })
        end,
    },
}
