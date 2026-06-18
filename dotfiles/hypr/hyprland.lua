local mainMod = "SUPER"

hl.curve("clean_spring", { type = "spring", mass = 1.0, stiffness = 140, dampening = 24 })
hl.curve("fade_curve", { type = "bezier", points = { { 0.25, 1.0 }, { 0.25, 1.0 } } })

hl.env("GTK_THEME", "Gruvbox-Dark-B")
hl.env("QT_STYLE_OVERRIDE", "kvantum")

hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")

hl.animation { leaf = "windows", enabled = true, speed = 2, spring = "clean_spring" }
hl.animation { leaf = "workspaces", enabled = true, speed = 2, spring = "clean_spring", style = "slide" }
hl.animation { leaf = "fade", enabled = true, speed = 1, bezier = "fade_curve" }

hl.config {
    general = {
        gaps_in = 1,
        gaps_out = 2,
        border_size = 2,
        ["col.active_border"] = "rgba(eb9f46ff)",
        ["col.inactive_border"] = "rgba(eb5346ff)",

        resize_on_border = true,
        extend_border_grab_area = 15,
    },
    decoration = {
        rounding = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        blur = {
            enabled = false,
        },
    },
    misc = {
        disable_hyprland_logo = true,
        disable_watchdog_warning = true,
    },
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = true,
            tap_to_click = true,
        },
    },
    cursor = {
        no_hardware_cursors = true,
        inactive_timeout = 0,
    },
    xwayland = {
        force_zero_scaling = true,
    },
}

local hostname = ""

local handle = io.popen "hostname"
if handle then
    local res = handle:read "*a"
    if res then
        hostname = res:gsub("%s+", "")
    end
    handle:close()
end

local ui_scale = 1
if hostname == "minotaur" then
    ui_scale = 1.33
end

hl.monitor {
    output = "",
    mode = "preferred",
    position = "auto",
    scale = ui_scale,
}

hl.window_rule {
    name = "flameshot-overlay",

    match = {
        class = "^(flameshot)$",
    },

    float = true,
    move = "0 0",
    pin = true,
    fullscreen_state = "0 2",
    size = "100% 100%",
}

--[[
hl.window_rule({ match = { class = "^(steam)$", title = "^(Friends List)$" }, float = true })
hl.window_rule({ match = { class = "^(steam)$", title = "^(Steam - News)$" }, float = true })
hl.window_rule({ match = { class = "^(steam)$", title = ".*(Chat).*" }, float = true })
hl.window_rule({ match = { class = "^(steam)$", title = "^(.?Settings.?)$" }, float = true })
hl.window_rule({ match = { class = "^(steam)$", title = "^(Store - .*)$" }, float = true })
hl.window_rule({ match = { class = "^(pavucontrol)$" }, float = true })
hl.window_rule({ match = { class = "^(nm-connection-editor)$" }, float = true })
hl.window_rule({ match = { title = "^(Open File)$" }, float = true })
hl.window_rule({ match = { title = "^(Choose Folder)$" }, float = true })
]]

hl.on("hyprland.start", function()
    hl.exec_cmd "hyprpaper"
    hl.exec_cmd "waybar"
    hl.exec_cmd "dunst"
    hl.exec_cmd "hypridle"
    hl.exec_cmd "nm-applet --indicator"
    hl.exec_cmd "systemctl --user start hyprpolkitagent"
    hl.exec_cmd "wl-paste --type text --watch cliphist store"
    hl.exec_cmd "wl-paste --type image --watch cliphist store"
    hl.exec_cmd "swayosd-server"
    hl.exec_cmd "elephant"
    hl.exec_cmd "walker --gapplication-service"
    hl.exec_cmd "systemctl --user import-environment QT_STYLE_OVERRIDE GTK_THEME XDG_CURRENT_DESKTOP DISPLAY WAYLAND_DISPLAY HYPRLAND_INSTANCE_SIGNATURE"
    hl.exec_cmd "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE"
    hl.exec_cmd "gnome-keyring-daemon --start --components=secrets"
    hl.exec_cmd "kitty"
end)

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd "loginctl lock-screenshot")

--hl.bind("CONTROL + " .. mainMod .. " + SPACE", hl.dsp.exec_cmd "walker")
--hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd "rofi -show drun")
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd "walker")
hl.bind("CONTROL + " .. mainMod .. " + SPACE", hl.dsp.exec_cmd "rofi -show drun")

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd "kitty")
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd "firefox")

hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen("maximized", "toggle"))
hl.bind(mainMod .. " + ALT + K", hl.dsp.exec_cmd "hyprctl dispatch pin")

hl.bind(
    mainMod .. " + SHIFT + LEFT",
    hl.dsp.focus {
        direction = "l",
    }
)
hl.bind(
    mainMod .. " + SHIFT + RIGHT",
    hl.dsp.focus {
        direction = "r",
    }
)
hl.bind(
    mainMod .. " + SHIFT + UP",
    hl.dsp.focus {
        direction = "u",
    }
)
hl.bind(
    mainMod .. " + SHIFT + DOWN",
    hl.dsp.focus {
        direction = "d",
    }
)

hl.bind("ALT + TAB", hl.dsp.exec_cmd "walker --modules windows")

hl.bind(
    "CONTROL + " .. mainMod .. " + LEFT",
    hl.dsp.focus {
        workspace = "r-1",
    }
)
hl.bind(
    "CONTROL + " .. mainMod .. " + RIGHT",
    hl.dsp.focus {
        workspace = "r+1",
    }
)

hl.bind(
    "CONTROL + " .. mainMod .. " + SHIFT + LEFT",
    hl.dsp.window.move {
        workspace = "r-1",
    }
)
hl.bind(
    "CONTROL + " .. mainMod .. " + SHIFT + RIGHT",
    hl.dsp.window.move {
        workspace = "r+1",
    }
)

hl.bind(
    mainMod .. " + LEFT",
    hl.dsp.window.move {
        direction = "l",
    }
)
hl.bind(
    mainMod .. " + RIGHT",
    hl.dsp.window.move {
        direction = "r",
    }
)
hl.bind(
    mainMod .. " + UP",
    hl.dsp.window.move {
        direction = "u",
    }
)
hl.bind(
    mainMod .. " + DOWN",
    hl.dsp.window.move {
        direction = "d",
    }
)

for i = 1, 9 do
    hl.bind(
        mainMod .. " + " .. i,
        hl.dsp.focus {
            workspace = tostring(i),
        }
    )
    hl.bind(
        mainMod .. " + SHIFT + " .. i,
        hl.dsp.window.move {
            workspace = tostring(i),
        }
    )
end

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd "playerctl play-pause")
hl.bind("XF86AudioNext", hl.dsp.exec_cmd "playerctl next")
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd "playerctl previous")

hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd "wlogout")
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd "hyprpicker -a")

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd "swayosd-client --output-volume raise", {
    repeating = true,
})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd "swayosd-client --output-volume lower", {
    repeating = true,
})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd "swayosd-client --output-volume mute-toggle")
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd "swayosd-client --brightness raise", {
    repeating = true,
})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd "swayosd-client --brightness lower", {
    repeating = true,
})

hl.bind(mainMod .. " + S", hl.dsp.exec_cmd 'grim -g "$(slurp)" - | wl-copy')
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd "XDG_CURRENT_DESKTOP=sway flameshot gui")
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd "QT_SCALE_FACTOR=1 GDK_SCALE=1 XDG_CURRENT_DESKTOP=sway flameshot gui")

-- virtual desktop binds
---hl.bind("CONTROL + " .. mainMod .. " + UP", hl.dsp.exec_cmd "cyclevdesks")
---hl.bind("CONTROL + " .. mainMod .. " + DOWN", hl.dsp.exec_cmd "backcyclevdesks")
---
---hl.bind("CONTROL + " .. mainMod .. " + SHIFT + UP", hl.dsp.exec_cmd "movetonextdesk 1")
---hl.bind("CONTROL + " .. mainMod .. " + SHIFT + DOWN", hl.dsp.exec_cmd "movetoprevdesk 1")
