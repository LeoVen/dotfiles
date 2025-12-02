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
            { '<leader>fs', function() Snacks.picker.smart() end, desc = 'Smart Find Files' },

            -- Files
            { '<leader>ff', function() Snacks.picker.files({ cmd = "rg", hidden = true }) end, desc = 'Find Files' },
            { '<leader>fF', function() Snacks.picker.files({ cmd = "rg", hidden = true, ignored = true }) end, desc = 'Find All Files' },
            { '<leader>fR', function() Snacks.picker.recent() end, desc = 'Recent' },
            { '<leader>e', function() Snacks.explorer() end, desc = 'File Explorer' },

            -- File Contents
            { '<leader><space>', function() Snacks.picker.buffers() end, desc = 'Buffers' },
            { '<leader>fg', function() Snacks.picker.grep() end, desc = 'Find Grep' },
            { '<leader>fl', function() Snacks.picker.lines() end, desc = 'Buffer Lines' },
            { "<leader>/", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
            { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },

            -- Neovim Stuff
            { '<leader>f:', function() Snacks.picker.command_history() end, desc = 'Command History' },
            { '<leader>fn', function() Snacks.picker.notifications() end, desc = 'Notification History' },
            { '<leader>f"', function() Snacks.picker.registers() end, desc = 'Registers' },
            { '<leader>f/', function() Snacks.picker.search_history() end, desc = 'Search History' },
            { '<leader>fh', function() Snacks.picker.help() end, desc = 'Help Pages' },
            { '<leader>fk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
            { '<leader>fc', function() Snacks.picker.commands() end, desc = 'Commands' },
            { '<leader>fP', function() Snacks.picker.lazy() end, desc = 'Search for Plugin Spec' },
            { '<leader>fC', function() Snacks.picker.colorschemes() end, desc = 'Colorschemes' },

            -- Diagnostics
            { '<leader>fd', function() Snacks.picker.diagnostics() end, desc = 'Diagnostics' },
            { '<leader>fD', function() Snacks.picker.diagnostics_buffer() end, desc = 'Buffer Diagnostics' },

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
