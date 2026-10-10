local hostname = (io.popen("hostname"):read("*a")):gsub("%s+", "")

local monitors

if hostname == "minotaur" then
    monitors = {
        {
            name = "eDP-1",
            resolution = "2560x1600@240.0",
            position = "1920x0",
            scale = 1.33,
        },
        {
            name = "HDMI-A-1",
            resolution = "1920x1080@144.0",
            position = "0x0",
            scale = 1.0,
        },
    }
elseif hostname == "pilgrim" then
    monitors = {
        {
            name = "eDP-1",
            resolution = "2560x1600@240.0",
            position = "1920x0",
            scale = 1.25,
        },
        {
            name = "HDMI-A-1",
            resolution = "1920x1080@144.0",
            position = "0x0",
            scale = 1.0,
        },
    }
else
    monitors = {}
end

return monitors
