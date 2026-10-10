local hostname = (io.popen("hostname"):read("*a")):gsub("%s+", "")

local laptop_scale = 1.0
if hostname == "minotaur" then
    laptop_scale = 1.33
elseif hostname == "pilgrim" then
    laptop_scale = 1.25
end

local monitors = {
    {
        name = "HDMI-A-1",
        resolution = "1920x1080@144.0",
        position = "0x0",
        scale = 1.0,
    },
    {
        name = "eDP-1",
        resolution = "2560x1600@240.0",
        position = "1920x0",
        scale = laptop_scale,
    },
}

return monitors
