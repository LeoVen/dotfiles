-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
        's1n7ax/nvim-window-picker',
    },
    cmd = 'Neotree',
    keys = {
        { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
    },
    opts = {
        filesystem = {
            window = {
                position = 'left',
                width = 40,
                mappings = {
                    ['\\'] = 'close_window',
                    -- Focus parent directory or closes it
                    ['h'] = function(state)
                        local node = state.tree:get_node()
                        if (node.type == 'directory' or node:has_children()) and node:is_expanded() then
                            state.commands.toggle_node(state)
                        else
                            require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
                        end
                    end,
                    -- Opens current directory or focus first child
                    ['l'] = function(state)
                        local node = state.tree:get_node()
                        if node.type == 'directory' or node:has_children() then
                            if not node:is_expanded() then
                                state.commands.toggle_node(state)
                            else
                                require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
                            end
                        end
                    end,
                    ['Y'] = function(state)
                        local node = state.tree:get_node()
                        local filepath = node:get_id()
                        local filename = node.name
                        local modify = vim.fn.fnamemodify

                        local vals = {
                            ['FILENAME'] = filename,
                            ['BASENAME'] = modify(filename, ':r'),
                            ['EXTENSION'] = modify(filename, ':e'),
                            ['PATH (CWD)'] = modify(filepath, ':.'),
                            ['PATH (HOME)'] = modify(filepath, ':~'),
                            ['PATH'] = filepath,
                            ['URI'] = vim.uri_from_fname(filepath),
                        }

                        local options = vim.tbl_filter(function(val)
                            return vals[val] ~= ''
                        end, vim.tbl_keys(vals))
                        if vim.tbl_isempty(options) then
                            vim.notify('No values to copy', vim.log.levels.WARN)
                            return
                        end
                        table.sort(options)
                        vim.ui.select(options, {
                            prompt = 'Choose to copy to clipboard:',
                            format_item = function(item)
                                return ('%s: %s'):format(item, vals[item])
                            end,
                        }, function(choice)
                            local result = vals[choice]
                            if result then
                                vim.notify(('Copied: `%s`'):format(result))
                                vim.fn.setreg('+', result)
                            end
                        end)
                    end,
                },
            },
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignore = true,
                show_hidden_count = true,
            },
        },
    },
}
