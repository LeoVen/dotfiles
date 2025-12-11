-- Rust-specific DAP configurations
return {
    {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        program = function()
            -- This function builds the project first and then
            -- allows you to select an executable

            vim.notify('Building project, please wait...', vim.log.levels.WARN, {})

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
        sourceLanguages = { 'rust' },
    },
}
