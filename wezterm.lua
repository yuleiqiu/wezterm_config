-- Pull in the wezterm API
local wezterm = require('wezterm')

local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Obsidian'
-- config.color_scheme = 'Batman'

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.show_tab_index_in_tab_bar = false
config.tab_bar_at_bottom = false
config.tab_max_width = 50

config.enable_scroll_bar = true

config.default_cursor_style = 'SteadyBlock'
config.force_reverse_video_cursor = true

-- Font
config.font = wezterm.font_with_fallback {
    'GeistMono Nerd Font',
    'Inconsolata Nerd Font',
}
config.font_size = 13

config.mouse_bindings = {
    -- Make CTRL-Click open hyperlinks
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = act.OpenLinkAtMouseCursor,
    },

    -- NOTE that binding only the 'Up' event can give unexpected behaviors.
    -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
    {
        event = { Down = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = act.Nop,
    },
}

-- and finally, return the configuration to wezterm
return config
