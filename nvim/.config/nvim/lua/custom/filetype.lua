vim.filetype.add {
    extension = {
        h = function()
            if vim.fn.search('\\C^#include <[^>.]\\+>$', 'nw') ~= 0 then
                return 'cpp'
            end
            return 'c'
        end,
    },
}
