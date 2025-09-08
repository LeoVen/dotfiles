local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Color scheme
config.color_scheme = "Catppuccin Mocha"

-- Window Configuration
config.initial_cols = 135
config.initial_rows = 30
config.window_decorations = "RESIZE"

-- Tab Bar Configuration
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
config.use_fancy_tab_bar = false

return config
