local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action

-- wezterm.on('gui-startup', function()
--   local tab, pane, window = mux.spawn_window({})
--    window:gui_window():maximize()
-- end)

config.default_prog = { '/usr/local/bin/fish', '-l'}
config.window_decorations = 'RESIZE'
-- config.hide_tab_bar_if_only_one_tab = true

-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Batman'
-- config.color_scheme = 'Aci'
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 16

config.inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7,
}

scrollback_lines = 4000

-- config.window_background_image = 'wallpaper/darth_vader.png'
-- config.window_background_image = 'wallpaper/darth_vader_03.jpeg'
-- config.window_background_image = '/Users/gerret/.config/wezterm/wallpaper/darth_vader_02.png'
-- config.window_background_image = '/Users/gerret/.config/wezterm/wallpaper/kylo_ren.png'
-- config.window_background_image = '/Users/gerret/.config/wezterm/wallpaper/darth_vader_03.jpeg'
-- config.window_background_gradient = {
--     orientation = 'Vertical',
--     colors = {
--         -- '#0f0c29',
--         '#004423',
--         '#302b63',
--         '#24243e',
--     },
--     interpolation = 'Linear',
--     blend = 'Rgb',
-- }
-- config.window_background_opacity = 0.8




return config