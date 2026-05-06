local function treesitter_try_attach(buf, language)
    -- check if parser exists and load it
    if not vim.treesitter.language.add(language) then
        return
    end
    -- enables syntax highlighting and other treesitter features
    vim.treesitter.start(buf, language)

    -- enables treesitter based folds
    -- for more info on folds see `:help folds`
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

    -- enables treesitter based indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

local available_parsers = require('nvim-treesitter').get_available()
vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        local buf, filetype = args.buf, args.match
        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
            return
        end

        local installed_parsers = require('nvim-treesitter').get_installed('parsers')

        if vim.tbl_contains(installed_parsers, language) then
            -- enable the parser if it is installed
            treesitter_try_attach(buf, language)
        elseif vim.tbl_contains(available_parsers, language) then
            -- if a parser is available in `nvim-treesitter` enable it after ensuring it is installed
            require('nvim-treesitter').install(language):await(function()
                treesitter_try_attach(buf, language)
            end)
        else
            -- try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
            treesitter_try_attach(buf, language)
        end
    end,
})

local parsers = {
    'bash',
    'c',
    'css',
    'csv',
    'diff',
    'dockerfile',
    'gitignore',
    'go',
    'gomod',
    'gosum',
    'hcl',
    'html',
    'javascript',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'proto',
    'python',
    'query',
    'rego',
    'rust',
    'sql',
    'toml',
    'typescript',
    'terraform',
    'vim',
    'vue',
    'vimdoc',
    'yaml',
}

-- ensure basic parser are installed
require('nvim-treesitter').install(parsers)

require('treesitter-context').setup({
    mode = 'cursor', -- 'cursor' or 'topline'
    line_numbers = true, -- show line numbers
    multiline_threshold = 1, -- How many lines the window should span. Values <= 0 mean no limit
    max_lines = 10, -- Maximum number of lines to show for a single context
})

-- incremental selection treesitter/lsp
vim.keymap.set({ 'n', 'x', 'o' }, '<A-o>', function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require('vim.treesitter._select').select_parent(vim.v.count1)
    else
        vim.lsp.buf.selection_range(vim.v.count1)
    end
end, { desc = 'Select parent treesitter node or outer incremental lsp selections' })

vim.keymap.set({ 'n', 'x', 'o' }, '<A-i>', function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require('vim.treesitter._select').select_child(vim.v.count1)
    else
        vim.lsp.buf.selection_range(-vim.v.count1)
    end
end, { desc = 'Select child treesitter node or inner incremental lsp selections' })
