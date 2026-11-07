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

-- TypeScript 7 (native Go port) ships no tsserver.js, so fall back to a TS 6 install
-- npm install --prefix ~/.local/share/typescript6 typescript@6
local tsserver_fallback_path = vim.fn.expand('~/.local/share/typescript6/node_modules/typescript/lib')

return {
    init_options = {
        plugins = {
            vue_plugin,
        },
        tsserver = {
            fallbackPath = tsserver_fallback_path,
        },
    },
    filetypes = file_types,
}
