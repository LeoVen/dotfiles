return {
    {
        'obsidian-nvim/obsidian.nvim',
        version = '*', -- recommended, use latest release instead of latest commit
        -- TODO: I need to figure this out. If I set ft, then the plugin doesn't load until I open a markdown file.
        --
        -- ft = 'markdown',
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
        --   -- refer to `:h file-pattern` for more examples
        --   "BufReadPre path/to/my-vault/*.md",
        --   "BufNewFile path/to/my-vault/*.md",
        -- },
        ---@module 'obsidian'
        ---@type obsidian.config
        opts = {
            ui = {
                -- Use render-markdown instead
                enabled = false,
            },
            workspaces = {
                {
                    name = 'MainVault',
                    path = '~/github/leoven/MainVault',
                },
            },
            -- TODO: later remove this once obsidian.nvim is updated
            -- legacy_commands is deprecated, use move from commands like `ObsidianBacklinks` to `Obsidian backlinks`
            -- and set `opts.legacy_commands` to false to get rid of this warning.
            -- see https://github.com/obsidian-nvim/obsidian.nvim/wiki/Commands for details.
            --      instead.
            -- Feature will be removed in obsidian.nvim 4.0
            legacy_commands = false,
            templates = {
                folder = '_templates',
                substitutions = {
                    journalTitle = function(_)
                        return '' .. os.date('%Y-W%V', os.time())
                    end,
                    date = function(_)
                        return '' .. os.date('%Y-%m-%d', os.time())
                    end,
                },
            },
            callbacks = {
                enter_note = function(_, _)
                    vim.keymap.set('n', '<leader>ot', '<CMD>Obsidian tags<CR>', { desc = '[O]bsidian [T]ags' })
                    vim.keymap.set('n', '<leader>op', '<CMD>Obsidian template<CR>', { desc = '[O]bsidian [P]aste from Template' })
                    vim.keymap.set('n', '<leader>ob', '<CMD>Obsidian backlinks<CR>', { desc = '[O]bsidian [B]acklinks' })
                end,
                post_setup = function(_)
                    vim.keymap.set('n', '<leader>os', '<CMD>Obsidian search<CR>', { desc = '[O]bsidian [S]earch' })
                    vim.keymap.set('n', '<leader>on', '<CMD>Obsidian new_from_template<CR>', { desc = '[O]bsidian [N]ew from Template' })
                end,
            },
        },
    },
}
