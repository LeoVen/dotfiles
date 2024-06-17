-- This file is "required" inside of nvim-cmp config

local ls = require 'luasnip'

ls.config.set_config {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    override_builtin = true,
}

require 'custom.snippets.lua'

vim.keymap.set({ 'i', 's' }, '<c-k>', function()
    return vim.snippet.active { direction = 1 } and vim.snippet.jump(1)
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-j>', function()
    return vim.snippet.active { direction = -1 } and vim.snippet.jump(-1)
end, { silent = true })
