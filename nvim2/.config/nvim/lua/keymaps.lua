-- Save without formatting
-- You can add `noau` before any command and it won't run any autocmds
vim.keymap.set('n', '<leader>wf', '<cmd>noau w<CR>', { desc = '[W]rite without [F]ormatting' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Clear highlight when pressing ESC
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>qd', vim.diagnostic.setqflist, { desc = 'Open diagnostic [Q]uickfix list' })
