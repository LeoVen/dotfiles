-- C-specific DAP configurations
return {
    {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        program = function()
            local file = vim.fn.expand '%:p'
            local out = vim.fn.expand '%:p:r'

            local result = vim.fn.system(string.format('clang -std=c23 -I . -glldb -fstandalone-debug %s -o %s', file, out))

            if vim.v.shell_error ~= 0 then
                vim.notify('Compile error:\n' .. result, vim.log.levels.ERROR)
                return nil
            end

            return out
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        sourceLanguages = { 'c' },
    },
}
