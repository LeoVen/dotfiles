return {
    {
        '3rd/image.nvim',
        build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
        opts = {
            processor = 'magick_cli',
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = true,
                    download_remote_images = true,
                    only_render_image_at_cursor = true,
                    only_render_image_at_cursor_mode = 'popup', -- or "inline"
                    floating_windows = true, -- if true, images will be rendered in floating markdown windows
                    filetypes = { 'markdown' }, -- markdown extensions (ie. quarto) can go here
                },
            },
            max_width = nil,
            max_height = nil,
            max_width_window_percentage = nil,
            max_height_window_percentage = nil,
        },
    },
}
