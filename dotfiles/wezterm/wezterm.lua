local wezterm = require "wezterm"
local config = wezterm.config_builder()

config.color_scheme = "Gruvbox dark, hard (base16)"
config.font = wezterm.font "RobotoMono Nerd Font"
config.font_size = 10.0
config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }
config.enable_wayland = true
config.hide_tab_bar_if_only_one_tab = true

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
    -- Split Panes (Ctrl+Space then v or s)
    { key = "v", mods = "LEADER", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { key = "s", mods = "LEADER", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },

    -- Move between panes (Ctrl+Shift + h/j/k/l)
    { key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection "Left" },
    { key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection "Right" },
    { key = "k", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection "Up" },
    { key = "j", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection "Down" },

    -- Close pane (Ctrl+Space then q)
    { key = "q", mods = "LEADER", action = wezterm.action.CloseCurrentPane { confirm = false } },
}

return config
