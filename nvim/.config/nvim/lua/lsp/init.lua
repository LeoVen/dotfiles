return {
    { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for Neovim
            { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            -- Useful status updates for LSP.
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', opts = {} },

            -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
            -- used for completion, annotations and signatures of Neovim apis
            {
                'folke/lazydev.nvim',
                ft = 'lua', -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                    },
                },
            },
        },
        config = function()
            -- LSP servers and clients are able to communicate to each other what features they support.
            --  By default, Neovim doesn't support everything that is in the LSP specification.
            --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
            --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
            -- In case of using blink
            -- capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

            --  Add any additional override configuration in the following tables. Available keys are:
            --  - cmd (table): Override the default command used to start the server
            --  - filetypes (table): Override the default list of associated filetypes for the server
            --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
            --  - settings (table): Override the default settings passed when initializing the server.
            --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
            local servers = {
                -- See `:help lspconfig-all` for a list of all the pre-configured LSPs
                ts_ls = {},
                rust_analyzer = {},
                terraformls = {},
                taplo = {},
                pyright = {},
                clangd = {
                    filetypes = { 'c', 'cpp' },
                },
                gopls = {},
                -- tailwindcss = {},
                jsonls = require 'lsp.jsonls',
                yamlls = require 'lsp.yamlls',

                lua_ls = {},

                marksman = {},
            }

            -- Ensure the servers and tools above are installed
            --  To check the current status of installed tools and/or manually install
            --  other tools, you can run
            --    :Mason
            --
            --  You can press `g?` for help in this menu.
            require('mason').setup()

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                'lua_ls', -- Used to format Lua code
            })

            require('mason-lspconfig').setup {
                ensure_installed = ensure_installed,
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        -- This handles overriding only values explicitly passed
                        -- by the server configuration above. Useful when disabling
                        -- certain features of an LSP (for example, turning off formatting for tsserver)
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        vim.lsp.config(server_name, server)
                        vim.lsp.enable(server)
                    end,
                },
            }

            vim.diagnostic.config {
                virtual_text = true,
            }
        end,
    },
}
