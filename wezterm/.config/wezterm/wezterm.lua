local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local act = wezterm.action

-- Color scheme
config.color_scheme = 'Catppuccin Mocha'

-- Window Configuration
config.initial_cols = 135
config.initial_rows = 30
config.window_decorations = 'RESIZE'

-- Tab Bar Configuration
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
config.use_fancy_tab_bar = false

config.keys = {
    -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
    {
        key = 'LeftArrow',
        mods = 'OPT',
        action = act.SendKey {
            key = 'b',
            mods = 'ALT',
        },
    },
    {
        key = 'RightArrow',
        mods = 'OPT',
        action = act.SendKey { key = 'f', mods = 'ALT' },
    },
}

-- Disable font ligatures
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

return config
