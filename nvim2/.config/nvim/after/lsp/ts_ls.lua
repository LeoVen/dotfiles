-- Setup ts_ls with vue_ls
--
-- Taken from:
-- https://github.com/vuejs/language-tools/wiki/Neovim

local vue_language_server_path = vim.fn.system('npm root -g'):gsub('%s+', '') .. '/@vue/language-server'

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
