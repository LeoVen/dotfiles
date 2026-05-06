require('conform').setup({
    notify_on_error = true,
    format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true, vue = true }
        return {
            timeout_ms = 500,
            lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
    end,
    -- :h conform-formatters
    -- https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters
    formatters_by_ft = {
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        json = { 'jq' },
        jsonc = { 'jq' },
        lua = { 'stylua' },
        python = { 'ruff_format', 'ruff_fix', 'ruff_organize_imports' },
        -- sql = { 'sqruff' },
        taplo = {},
        terraform = { 'tfmt' },
        ['terraform-vars'] = { 'tfmt' },
        toml = { 'taplo' },
        yaml = { 'yq' },
    },
    formatters = {
        tfmt = {
            command = 'tofu',
            args = { 'fmt', '-' },
            stdin = true,
        },
    },
})

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function(args)
        require('conform').format({ bufnr = args.buf })
    end,
})
