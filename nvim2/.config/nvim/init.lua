-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true
vim.g.editorconfig = true

require('autocmds')
require('commands')
require('keymaps')
require('options')
require('theme')

-- List of all installed LSPs, formatters and tooling
--
-- brew install hashicorp/tap/terraform-ls
-- brew install jq
-- brew install lua-language-server
-- brew install stylua
-- brew install tree-sitter-cli
-- brew install yq
-- cargo install taplo-cli --locked
-- cargo install sqruff --locked
-- go install github.com/sqls-server/sqls@latest
-- npm install -g @vue/language-server
-- npm install -g bash-language-server
-- npm install -g typescript typescript-language-server
-- npm install -g vscode-json-languageserver
-- npm install -g vscode-langservers-extracted # html, css, json, etc
-- npm install -g yaml-language-server
-- rustup component add rust-analyzer
-- uv tool install ruff@latest
-- uv tool install ty@latest
-- pip3 install sqlfluff

vim.pack.add({
    --
    -- Basic editor functionality
    --
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
    { src = 'https://github.com/stevearc/conform.nvim' },
    { src = 'https://github.com/mfussenegger/nvim-lint' },
    -- { src = 'https://github.com/saghen/blink.lib' }, -- TODO: once v2 gets stabilized
    {
        src = 'https://github.com/saghen/blink.cmp',
        version = 'v1.10.2', -- TODO: remove once v2 gets stabilized
    },
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/folke/snacks.nvim' },
    -- TODO:
    -- { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
    { src = 'https://github.com/tpope/vim-sleuth' },
    { src = 'https://github.com/kdheepak/lazygit.nvim' },
    --
    -- Extra editor functionality
    { src = 'https://github.com/romgrk/barbar.nvim' },
    { src = 'https://github.com/echasnovski/mini.nvim' },
    --
    -- Helpers
    --
    { src = 'https://github.com/folke/which-key.nvim' },
    { src = 'https://github.com/windwp/nvim-autopairs' },
    { src = 'https://github.com/folke/flash.nvim' },
    --
    -- Aesthetics
    --
    { src = 'https://github.com/echasnovski/mini.icons' },
    { src = 'https://github.com/luukvbaal/statuscol.nvim' },
    { src = 'https://github.com/folke/todo-comments.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/stevearc/quicker.nvim' },
    { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
    { src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },
    --
    -- Could me removed
    --
    -- I'm only using this plugin because it can do multi-line comments and it
    -- preserves cursor position, while neovim's native does not
    { src = 'https://github.com/numToStr/Comment.nvim' },
    -- I could setup lua LSP properly, but this is easier for now
    { src = 'https://github.com/folke/lazydev.nvim' },
    -- I could not find any pretty solution that uses only neovim
    { src = 'https://github.com/j-hui/fidget.nvim' },
}, { confirm = false })

-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
vim.lsp.enable('bashls')
vim.lsp.enable('clangd')
vim.lsp.enable('cssls')
vim.lsp.enable('gopls')
vim.lsp.enable('html')
vim.lsp.enable('jsonls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('rust_analyzer')
-- vim.lsp.enable('sqls')
vim.lsp.enable('terraformls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('ty')
vim.lsp.enable('vue_ls')
vim.lsp.enable('yamlls')

require('vim._core.ui2').enable()
