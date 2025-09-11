return {
    {
        'obsidian-nvim/obsidian.nvim',
        version = '*', -- recommended, use latest release instead of latest commit
        ft = 'markdown',
        ---@module 'obsidian'
        ---@type obsidian.config
        opts = {
            workspaces = {
                {
                    name = 'MainVault',
                    path = '~/leoven/github/MainVault',
                },
            },
            -- TODO: later remove this once obsidian.nvim is updated
            -- legacy_commands is deprecated, use move from commands like `ObsidianBacklinks` to `Obsidian backlinks`
            -- and set `opts.legacy_commands` to false to get rid of this warning.
            -- see https://github.com/obsidian-nvim/obsidian.nvim/wiki/Commands for details.
            --      instead.
            -- Feature will be removed in obsidian.nvim 4.0
            legacy_commands = false,
        },
    },
}
