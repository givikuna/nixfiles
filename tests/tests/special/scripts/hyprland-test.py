machine.wait_for_unit("graphical.target")
machine.wait_for_unit("hyprland-session.target")
machine.succeed("pgrep -f Hyprland")
