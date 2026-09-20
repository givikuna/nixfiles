{ ... }: {
  boot.blacklistedKernelModules = [
    "wacom"
    "hid_multitouch"
  ];

  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="event[0-9]*", ATTRS{name}=="Wacom HID 49C5 Finger", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    ACTION=="add|change", KERNEL=="event[0-9]*", ATTRS{name}=="Wacom HID 49C5 Pen", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';
}
