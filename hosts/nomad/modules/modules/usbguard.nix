{ ... }: {
  services.usbguard = {
    enable = true;
    dbus.enable = true;
    implicitPolicyTarget = "block";
    # allow devices currently plugged in during startup
    presentDevicePolicy = "allow";
  };

  # sudo usbguard list-devices
  # sudo usbguard allow-device <ID>
}
