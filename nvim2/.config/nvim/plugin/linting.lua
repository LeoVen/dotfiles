-- https://github.com/mfussenegger/nvim-lint/tree/master/lua/lint/linters
local linters = require('lint').linters_by_ft

-- linters['sql'] = { 'sqruff' }

-- Some lints support linting `stdin`, which then I could use `InsertLeave` or
-- `TextChanged` events too. But for now...
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
    group = vim.api.nvim_create_augroup('lint', { clear = true }),
    callback = function()
        require('lint').try_lint()
    end,
})
