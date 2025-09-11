local M = {}

-- Logging utility
local function log(msg)
    local logfile = vim.fn.stdpath 'state' .. '/dictionary.log'
    local line = os.date '%Y-%m-%d %H:%M:%S' .. ' ' .. msg
    vim.fn.writefile({ line }, logfile, 'a')
end

-- Fetch definition from dictionaryapi.dev (async)
local function fetch_definition(word, callback)
    local url = string.format('https://api.dictionaryapi.dev/api/v2/entries/en/%s', word)
    log('Fetching definition for: ' .. tostring(word) .. ' from ' .. url)
    vim.fn.jobstart({
        'curl',
        '-s',
        url,
    }, {
        stdout_buffered = true,
        on_stdout = function(_, data)
            if not data or #data == 0 then
                log('No definition found in API response for: ' .. tostring(word))
                callback 'No definition found.'
                return
            end
            local ok, result = pcall(vim.fn.json_decode, table.concat(data, '\n'))
            if not ok or not result or not result[1] or not result[1].meanings then
                log('API response could not be decoded for: ' .. tostring(word))
                callback 'No definition found.'
                return
            end
            local defs = {}
            for _, meaning in ipairs(result[1].meanings) do
                for _, def in ipairs(meaning.definitions) do
                    table.insert(defs, string.format('- %s', def.definition))
                end
            end
            log('Definition(s) found for ' .. tostring(word) .. ': ' .. table.concat(defs, '; '))
            callback(table.concat(defs, '\n'))
        end,
    })
end

-- Show definition in a floating window (signature help style)
local function show_definition_popup(word, definition)
    log('Showing popup for word: ' .. tostring(word))
    local lines = { string.format('Definition of "%s":', word) }
    for line in definition:gmatch '[^\n]+' do
        table.insert(lines, line)
    end
    vim.lsp.util.open_floating_preview(lines, 'markdown', { border = 'single' })
end

-- Main function to trigger lookup
function M.lookup_word()
    local selection = require 'util.selection'

    log 'Looking up word'

    local word = ''

    if vim.fn.mode() == 'n' then
        word = selection.get_word_under_cursor()

        if not word or word == '' then
            log 'No word under cursor to look up'

            vim.notify('No word selected or under cursor.', vim.log.levels.WARN)

            return
        end
    else -- V, v, visual-block
        local select = selection.get_visual_selection_text()

        if not select or next(select) == nil then
            log 'Could not determine selected word'
            vim.notify('Could not determine selected word', vim.log.levels.WARN)
            return
        end

        if #select == 1 then
            word = select[1]
        else
            -- Not supported
            log 'Multiline selection not supported'
            vim.notify('Multiline selection not supported', vim.log.levels.WARN)
            return
        end
    end

    log('Looking up word: ' .. tostring(word))
    fetch_definition(word, function(definition)
        show_definition_popup(word, definition)
    end)

    log 'end lookup word'
end

return M
