--  For more options, you can see `:help option-list`

-- Setting both to true, only the active line shows the line number
-- Make line numbers default
vim.opt.number = true
-- Relative line numbers, to help with jumping.
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '│ ', trail = '·', leadmultispace = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Folding options
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldenable = true -- Enable folding.
vim.o.foldcolumn = '1' -- Show folding signs.
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- Use treesitter for folding.
-- vim.o.foldexpr = 'v:lua.vim.lsp.foldexpr()' -- Use LSP for folding
vim.o.foldlevel = 999 -- Close all folds.
vim.o.foldlevelstart = 99 -- Start with all folds closed.
vim.o.foldmethod = 'expr' -- Use expr to determine fold level.
vim.o.foldopen = 'insert,mark,search,tag' -- Which commands open folds if the cursor moves into a closed fold.
vim.o.foldtext = '' -- What to display on fold
