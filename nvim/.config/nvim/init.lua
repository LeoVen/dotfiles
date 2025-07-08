-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.editorconfig = true

-- [[ Setting options ]]
-- See `:help vim.opt`
require 'custom.options'

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
require 'custom.mappings'

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
require 'custom.autocmds'

-- [[ File types ]]
-- See `:help file-types`
require 'custom.filetype'

-- Load Plugins
require 'core.lazy'
