vim.api.nvim_create_user_command('Cppath', function()
    local path = vim.fn.expand('%:p')
    vim.fn.setreg('+', path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command('Cpname', function()
    local name = vim.fn.expand('%:t')
    vim.fn.setreg('+', name)
    vim.notify('Copied "' .. name .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command('Cprel', function()
    local path = vim.fn.expand('%:~:.')
    vim.fn.setreg('+', path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command('RenderMermaid', function()
    if vim.fn.executable('mmdc') ~= 1 then
        vim.notify("Error: 'mmdc' (Mermaid CLI) is not installed or not in PATH.", vim.log.levels.ERROR)
        return
    end

    -- Extract visual selection text safely
    local reg_save = vim.fn.getreg('z')
    local regtype_save = vim.fn.getregtype('z')

    -- 'gv' re-selects the visual area, '"zy' yanks it into register 'z'
    vim.cmd('silent! normal! gv"zy')
    local selection = vim.fn.getreg('z')

    -- Restore register 'z' back to its original state
    vim.fn.setreg('z', reg_save, regtype_save)

    -- If I don't select the diagram line-by-line, I usually vi` and this tag ends up being added
    selection = selection:gsub('^%s*mermaid%s*\n', '', 1)

    if not selection or selection:match('^%s*$') then
        vim.notify('Error: No visual selection found or selection is empty.', vim.log.levels.WARN)
        return
    end

    local output_file = vim.fn.tempname() .. '.png'

    local config = { layout = 'elk' }
    for _, diagram in ipairs({
        'flowchart',
        'sequence',
        'gantt',
        'journey',
        'timeline',
        'class',
        'state',
        'er',
        'pie',
        'quadrantChart',
        'xyChart',
        'requirement',
        'mindmap',
        'kanban',
        'gitGraph',
        'c4',
        'sankey',
        'packet',
        'block',
        'architecture',
        'radar',
        'treemap',
    }) do
        config[diagram] = { useMaxWidth = false }
    end
    local config_file = vim.fn.tempname() .. '.json'
    vim.fn.writefile({ vim.json.encode(config) }, config_file)

    local cmd = { 'mmdc', '-i', '-', '-o', output_file, '-c', config_file, '-s', '2' }
    vim.system(cmd, { stdin = selection }, function(obj)
        os.remove(config_file)
        vim.schedule(function()
            if obj.code ~= 0 then
                local err_msg = obj.stderr ~= '' and obj.stderr or 'Failed to render Mermaid diagram.'
                vim.notify('Mermaid Render Error:\n' .. err_msg, vim.log.levels.ERROR)
            else
                vim.notify('Opening Mermaid diagram...', vim.log.levels.INFO)

                if vim.ui.open then
                    -- Nvim 0.10+
                    vim.ui.open(output_file)
                else
                    vim.system({ 'open', output_file })
                end
            end
        end)
    end)
end, { range = true, desc = 'Render visually selected Mermaid text and open the image' })
