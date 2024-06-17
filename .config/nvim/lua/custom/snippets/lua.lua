local ls = require 'luasnip'

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('lua', {
    s('hello', { t 'print("hello ', i(1), t ' world")' }),
})
