machine.wait_for_unit("network.target")

# check networkmanager
machine.succeed("systemctl is-active NetworkManager")

# if network is up
machine.succeed("ping -c 1 8.8.8.8")
