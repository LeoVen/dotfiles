return {
    {
        'folke/snacks.nvim',
        lazy = false,
        priority = 1001,
        dependencies = { 'MeanderingProgrammer/render-markdown.nvim' },
        opts = {
            picker = { enabled = true },
            explorer = { enabled = true },
            image = {
                enabled = true,
            },
        },
        -- stylua: ignore start
        keys = {
            -- Main
            { '<leader>fA', function() Snacks.picker() end, desc = 'All Pickers' },
            { '<leader>fr', function() Snacks.picker.resume() end, desc = 'Resume' },
            -- Pickers & Explorer
            { '<leader><space>', function() Snacks.picker.smart() end, desc = 'Smart Find Files' },

            { '<leader>,', function() Snacks.picker.buffers() end, desc = 'Buffers' },
            { '<leader>fg', function() Snacks.picker.grep() end, desc = 'Find Grep' },
            { '<leader>:', function() Snacks.picker.command_history() end, desc = 'Command History' },
            { '<leader>n', function() Snacks.picker.notifications() end, desc = 'Notification History' },
            { '<leader>e', function() Snacks.explorer() end, desc = 'File Explorer' },

            -- find
            { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Buffers' },
            { '<leader>fc', function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, desc = 'Find Config File' },

            { '<leader>ff', function() Snacks.picker.files({ cmd = "rg", hidden = true }) end, desc = 'Find Files' },
            { '<leader>fF', function() Snacks.picker.files({ cmd = "rg", hidden = true, ignored = true }) end, desc = 'Find All Files' },

            { '<leader>fG', function() Snacks.picker.git_files() end, desc = 'Find Git Files' },
            { '<leader>fp', function() Snacks.picker.projects() end, desc = 'Projects' },
            { '<leader>fR', function() Snacks.picker.recent() end, desc = 'Recent' },
            -- git
            -- { '<leader>gb', function() Snacks.picker.git_branches() end, desc = 'Git Branches' },
            -- { '<leader>gl', function() Snacks.picker.git_log() end, desc = 'Git Log' },
            -- { '<leader>gL', function() Snacks.picker.git_log_line() end, desc = 'Git Log Line' },
            -- { '<leader>gs', function() Snacks.picker.git_status() end, desc = 'Git Status' },
            -- { '<leader>gS', function() Snacks.picker.git_stash() end, desc = 'Git Stash' },
            -- { '<leader>gd', function() Snacks.picker.git_diff() end, desc = 'Git Diff (Hunks)' },
            -- { '<leader>gf', function() Snacks.picker.git_log_file() end, desc = 'Git Log File' },
            -- search
            -- { '<leader>s"', function() Snacks.picker.registers() end, desc = 'Registers' },
            -- { '<leader>s/', function() Snacks.picker.search_history() end, desc = 'Search History' },
            -- { '<leader>sa', function() Snacks.picker.autocmds() end, desc = 'Autocmds' },
            -- { '<leader>sb', function() Snacks.picker.lines() end, desc = 'Buffer Lines' },
            -- { '<leader>sc', function() Snacks.picker.command_history() end, desc = 'Command History' },
            -- { '<leader>sC', function() Snacks.picker.commands() end, desc = 'Commands' },
            -- { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = 'Diagnostics' },
            -- { '<leader>sD', function() Snacks.picker.diagnostics_buffer() end, desc = 'Buffer Diagnostics' },
            -- { '<leader>sh', function() Snacks.picker.help() end, desc = 'Help Pages' },
            -- { '<leader>sH', function() Snacks.picker.highlights() end, desc = 'Highlights' },
            -- { '<leader>si', function() Snacks.picker.icons() end, desc = 'Icons' },
            -- { '<leader>sj', function() Snacks.picker.jumps() end, desc = 'Jumps' },
            -- { '<leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
            -- { '<leader>sl', function() Snacks.picker.loclist() end, desc = 'Location List' },
            -- { '<leader>sm', function() Snacks.picker.marks() end, desc = 'Marks' },
            -- { '<leader>sM', function() Snacks.picker.man() end, desc = 'Man Pages' },
            -- { '<leader>sp', function() Snacks.picker.lazy() end, desc = 'Search for Plugin Spec' },
            -- { '<leader>sq', function() Snacks.picker.qflist() end, desc = 'Quickfix List' },
            -- { '<leader>su', function() Snacks.picker.undo() end, desc = 'Undo History' },
            -- { '<leader>uC', function() Snacks.picker.colorschemes() end, desc = 'Colorschemes' },
            -- LSP
            { 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition' },
            { 'gD', function() Snacks.picker.lsp_declarations() end, desc = 'Goto Declaration' },
            { 'gr', function() Snacks.picker.lsp_references() end, nowait = true, desc = 'References' },
            { 'gI', function() Snacks.picker.lsp_implementations() end, desc = 'Goto Implementation' },
            { 'gy', function() Snacks.picker.lsp_type_definitions() end, desc = 'Goto T[y]pe Definition' },
            { 'gai', function() Snacks.picker.lsp_incoming_calls() end, desc = 'C[a]lls Incoming' },
            { 'gao', function() Snacks.picker.lsp_outgoing_calls() end, desc = 'C[a]lls Outgoing' },
            { '<leader>ss', function() Snacks.picker.lsp_symbols() end, desc = 'LSP Symbols' },
            { '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP Workspace Symbols' },
        },
        -- stylua: ignore end
    },
}
