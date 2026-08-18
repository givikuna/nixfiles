# NixOS VM test driver script
machine.wait_for_unit("basic.target")

# Verify root filesystem is ext4
fstype = machine.succeed("findmnt -n -o FSTYPE /").strip()
assert fstype == "ext4", f"Expected root to be ext4, got {fstype}"

# Check fstrim periodic service availability
machine.succeed("systemctl list-unit-files | grep fstrim.timer")

# Verify that udisks2 and gvfs services are active
machine.wait_for_unit("udisks2.service")
machine.succeed("systemctl status udisks2.service")