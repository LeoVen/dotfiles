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
                '<F5>',
                function()
                    require('dap').continue()
                end,
                desc = 'Debug: Start/Continue',
            },
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
            -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
            {
                '<F7>',
                function()
                    require('dapui').toggle()
                end,
                desc = 'Debug: See last session result.',
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
                },
            }

            -- Dap UI setup
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
            }

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

            -- TODO: move these to JS specific configs
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
            }

            for _, language in ipairs { 'typescript', 'javascript' } do
                require('dap').configurations[language] = {
                    {
                        type = 'pwa-node',
                        request = 'launch',
                        name = 'Launch file',
                        program = '${file}',
                        cwd = '${workspaceFolder}',
                    },
                    {
                        type = 'pwa-node',
                        request = 'attach',
                        name = 'Attach',
                        processId = require('dap.utils').pick_process,
                        cwd = '${workspaceFolder}',
                        port = 9229,
                    },
                }
            end

            dap.configurations['typescript'] = {
                {
                    name = 'NestJS: debug',
                    type = 'pwa-node',
                    request = 'launch',
                    trace = true,
                    cwd = vim.fn.getcwd(),
                    runtimeExecutable = 'node',
                    program = '${workspaceFolder}/node_modules/@nestjs/cli/bin/nest.js',
                    args = {
                        'start',
                        '--debug',
                        '--watch',
                        '--preserveWatchOutput',
                    },
                    sourceMaps = true,
                    stopOnEntry = false,
                    console = 'integratedTerminal',
                    protocol = 'auto',
                    outDir = '${workspaceFolder}/dist',
                    restart = true,
                },
            }

            dap.configurations.rust = {
                {
                    name = 'Launch file',
                    type = 'codelldb',
                    request = 'launch',
                    program = function()
                        -- This function builds the project first and then
                        -- allows you to select an executable

                        vim.notify('Building project, please wait...', vim.log.levels.WARN)

                        local output = vim.fn.systemlist 'cargo build -q --message-format=json 2>1'

                        local i = 1
                        local executables = {}
                        local selections = {}
                        selections[i] = 'Select executable:'

                        for _, l in ipairs(output) do
                            local json = vim.json.decode(l)
                            if json == nil then
                                error 'error parsing json'
                            end
                            if json.success == false then
                                return error 'error building package'
                            end
                            if type(json.executable) == 'string' then
                                executables[i] = json.executable
                                selections[i + 1] = i .. ': ' .. json.executable
                                i = i + 1
                            end
                        end

                        return executables[vim.fn.inputlist(selections)]
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},
                },
            }
        end,
    },
}
