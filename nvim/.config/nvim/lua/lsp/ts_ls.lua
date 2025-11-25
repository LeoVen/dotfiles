-- Setup ts_ls with vue_ls
--
-- Taken from:
-- https://github.com/vuejs/language-tools/wiki/Neovim

local mason_packages = vim.fn.expand '$MASON/packages'
local vue_language_server_path = mason_packages .. '/vue-language-server' .. '/node_modules/@vue/language-server'

local file_types = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }

local vue_plugin = {
    name = '@vue/typescript-plugin',
    location = vue_language_server_path,
    languages = { 'vue' },
    configNamespace = 'typescript',
}

return {
    init_options = {
        plugins = {
            vue_plugin,
        },
    },
    filetypes = file_types,
}
