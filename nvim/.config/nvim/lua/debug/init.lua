return {
    {
        -- TODO: move this to JS specific configs
        'mxsdev/nvim-dap-vscode-js',
        dependencies = {
            'mfussenegger/nvim-dap',
            {
                'microsoft/vscode-js-debug',
                build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
            },
        },
    },
    {
        -- Installation
        -- https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
        'mfussenegger/nvim-dap',
        dependencies = {
            -- Debugger UI
            'rcarriga/nvim-dap-ui',
            -- Required dependency for nvim-dap-ui
            'nvim-neotest/nvim-nio',
            -- Installs the debug
            'jay-babu/mason-nvim-dap.nvim',
        },
        keys = {
            {
                '<F1>',
                function()
                    require('dap').step_into()
                end,
                desc = 'Debug: Step Into',
            },
            {
                '<F2>',
                function()
                    require('dap').step_over()
                end,
                desc = 'Debug: Step Over',
            },
            {
                '<F3>',
                function()
                    require('dap').step_out()
                end,
                desc = 'Debug: Step Out',
            },
            {
                '<F4>',
                function()
                    require('dap').list_breakpoints()
                end,
                desc = 'Debug: List breakpoints',
            },
            {
                '<F5>',
                function()
                    require('dap').continue()
                end,
                desc = 'Debug: Start/Continue',
            },
            {
                '<F6>',
                function()
                    require('dap').close()
                end,
                desc = 'Debug: Stop',
            },
            {
                -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
                '<F7>',
                function()
                    require('dapui').toggle()
                end,
                desc = 'Debug: See last session result.',
            },
            {
                '<leader>db',
                function()
                    require('dap').toggle_breakpoint()
                end,
                desc = 'Debug: Toggle Breakpoint',
            },
            {
                '<leader>dB',
                function()
                    require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
                end,
                desc = 'Debug: Set Breakpoint',
            },
        },
        config = function()
            local dap = require 'dap'
            local dapui = require 'dapui'

            -- Available debug adapters:
            -- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
            require('mason-nvim-dap').setup {
                automatic_installation = true,
                ensure_installed = {
                    'js-debug-adapter',
                    'codelldb',
                    'delve',
                },
            }

            -- Dap UI setup
            ---@type dapui.Config
            dapui.setup {
                -- Set icons to characters that are more likely to work in every terminal.
                --    Feel free to remove or use ones that you like more! :)
                --    Don't feel like these are good choices.
                icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
                controls = {
                    icons = {
                        pause = '⏸',
                        play = '▶',
                        step_into = '⏎',
                        step_over = '⏭',
                        step_out = '⏮',
                        step_back = 'b',
                        run_last = '▶▶',
                        terminate = '⏹',
                        disconnect = '⏏',
                    },
                },
                layouts = {
                    -- scopes, breakpoints, stacks, watches, repl, console
                    {
                        -- You can change the order of elements in the sidebar
                        elements = {
                            -- Provide IDs as strings or tables with "id" and "size" keys
                            {
                                id = 'scopes',
                                size = 0.25, -- Can be float or integer > 1
                            },
                            { id = 'breakpoints', size = 0.25 },
                            { id = 'stacks', size = 0.25 },
                            { id = 'watches', size = 0.25 },
                        },
                        size = 40,
                        position = 'left', -- Can be "left" or "right"
                    },
                    {
                        elements = {
                            'console',
                        },
                        size = 10,
                        position = 'bottom', -- Can be "bottom" or "top"
                    },
                    {
                        elements = {
                            'repl',
                        },
                        size = 10,
                        position = 'bottom', -- Can be "bottom" or "top"
                    },
                },
            }

            vim.keymap.set('n', '<leader>de', function()
                dapui.eval()
            end, { desc = 'Dapui: Eval' })

            vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
            vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
            local breakpoint_icons = vim.g.have_nerd_font
                    and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
                or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
            for type, icon in pairs(breakpoint_icons) do
                local tp = 'Dap' .. type
                local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
                vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
            end

            dap.listeners.after.event_initialized['dapui_config'] = dapui.open
            dap.listeners.before.event_terminated['dapui_config'] = dapui.close
            dap.listeners.before.event_exited['dapui_config'] = dapui.close

            dap.adapters = {
                ['pwa-node'] = {
                    type = 'server',
                    host = 'localhost',
                    port = '${port}',
                    executable = {
                        command = 'js-debug-adapter',
                        args = {
                            '${port}',
                        },
                    },
                },
                ['codelldb'] = {
                    type = 'server',
                    port = '${port}',
                    executable = {
                        command = 'codelldb',
                        args = { '--port', '${port}' },
                    },
                },
                ['go'] = {
                    type = 'server',
                    port = '${port}',
                    executable = {
                        command = 'dlv',
                        args = { 'dap', '-l', '127.0.0.1:${port}' },
                    },
                },
                ['python'] = function(cb, config)
                    -- https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#python
                    if config.request == 'attach' then
                        ---@diagnostic disable-next-line: undefined-field
                        local port = (config.connect or config).port
                        ---@diagnostic disable-next-line: undefined-field
                        local host = (config.connect or config).host or '127.0.0.1'
                        cb {
                            type = 'server',
                            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                            host = host,
                            options = {
                                source_filetype = 'python',
                            },
                        }
                    else
                        cb {
                            type = 'executable',
                            command = '.venv/bin/python', -- Assuming debugpy is installed with uv in cwd/.venv
                            args = { '-m', 'debugpy.adapter' },
                            options = {
                                source_filetype = 'python',
                            },
                        }
                    end
                end,
            }

            dap.configurations.go = require 'debug.go'
            dap.configurations.typescript = require 'debug.typescript'
            dap.configurations.rust = require 'debug.rust'
            dap.configurations.python = require 'debug.python'
        end,
    },
}
