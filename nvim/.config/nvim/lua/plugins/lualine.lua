local function get_linters()
    local buf_client_names = {}
    local num_client_names = #buf_client_names

    local buf_ft = vim.bo.filetype

    -- Add linters for the current filetype (nvim-lint)
    local lint_success, lint = pcall(require, 'lint')
    if lint_success then
        for ft, ft_linters in pairs(lint.linters_by_ft) do
            if ft == buf_ft then
                if type(ft_linters) == 'table' then
                    for _, linter in pairs(ft_linters) do
                        num_client_names = num_client_names + 1
                        buf_client_names[num_client_names] = linter
                    end
                else
                    num_client_names = num_client_names + 1
                    buf_client_names[num_client_names] = ft_linters
                end
            end
        end
    end

    local client_names_str = table.concat(buf_client_names, ', ')
    local result = string.format('L[%s]', client_names_str)

    return result
end

local function get_formatters()
    local buf_client_names = {}
    local num_client_names = #buf_client_names

    -- Add formatters (conform.nvim)
    local conform_success, conform = pcall(require, 'conform')
    if conform_success then
        for _, formatter in pairs(conform.list_formatters_for_buffer(0)) do
            if formatter then
                num_client_names = num_client_names + 1
                buf_client_names[num_client_names] = formatter
            end
        end
    end

    local client_names_str = table.concat(buf_client_names, ', ')
    local result = string.format('F[%s]', client_names_str)

    return result
end

local function get_language_servers()
    -- Get active clients for current buffer
    local buf_clients = vim.lsp.get_clients { bufnr = 0 }
    if #buf_clients == 0 then
        return '[]'
    end

    local buf_client_names = {}
    local num_client_names = #buf_client_names
    -- Add lsp-clients active in the current buffer
    for _, client in pairs(buf_clients) do
        num_client_names = num_client_names + 1
        buf_client_names[num_client_names] = client.name
    end

    local client_names_str = table.concat(buf_client_names, ', ')
    local result = string.format('[%s]', client_names_str)

    return result
end

local function get_attached_clients()
    local linters = get_linters()
    local formatters = get_formatters()
    local lsps = get_language_servers()

    local result = string.format('%s %s %s', lsps, formatters, linters)

    return result
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin/nvim' },
    event = { 'VimEnter', 'BufReadPost', 'BufNewFile' },
    config = function()
        local attached_clients = {
            get_attached_clients,
            color = {
                gui = 'bold',
            },
        }

        require('lualine').setup {
            options = {
                theme = 'auto',
                globalstatus = true,
                component_separators = { left = '|', right = '|' },
            },

            sections = {
                lualine_b = { 'branch', 'diff' },
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = { 'diagnostics', attached_clients, 'filetype' },
            },
        }
    end,
}
