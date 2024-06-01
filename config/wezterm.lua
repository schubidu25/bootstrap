local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { '/usr/local/bin/fish', '-l'}

-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Batman'
-- config.color_scheme = 'Aci'
-- config.font = wezterm.font 'JetBrains Mono'

-- config.window_background_image = 'wallpaper/darth_vader.png'
config.window_background_image = 'wallpaper/darth_vader_03.jpeg'
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