return {
    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            -- { 'nvim-treesitter/nvim-treesitter-textobjects' },
            {
                'nvim-treesitter/nvim-treesitter-context', -- Show code context
                opts = {
                    enable = true, -- Enable this plugin
                    mode = 'cursor', -- 'cursor' or 'topline'
                    line_numbers = true, -- show line numbers
                    multiline_threshold = 1, -- How many lines the window should span. Values <= 0 mean no limit
                    max_lines = 10, -- Maximum number of lines to show for a single context
                },
            },
        },
        opts = {
            ensure_installed = {
                'bash',
                'c',
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
                'proto',
                'python',
                'rego',
                'rust',
                'sql',
                'toml',
                'typescript',
                'terraform',
                'vim',
                'vimdoc',
                'yaml',
            },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
                enable = true,
                -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                --  If you are experiencing weird indenting issues, add the language to
                --  the list of additional_vim_regex_highlighting and disabled languages for indent.
                additional_vim_regex_highlighting = { 'ruby' },
            },
            indent = { enable = true, disable = { 'ruby' } },
        },
        config = function(_, opts)
            -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

            -- Prefer git instead of curl in order to improve connectivity in some environments
            require('nvim-treesitter.install').prefer_git = true
            ---@diagnostic disable-next-line: missing-fields
            require('nvim-treesitter.configs').setup(opts)

            -- There are additional nvim-treesitter modules that you can use to interact
            -- with nvim-treesitter. You should go explore a few and see what interests you:
            --
            --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
            --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
            --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        end,
    },
}
