{
  lib,
  config,
  pkgs,
  ...
}:

let
  preSetupScript = pkgs.writeShellScript "lazyspotify-presetup.sh" ''
    export PATH=/usr/bin:/bin:$PATH
    pacman-key --init
    pacman-key --populate archlinux
    pacman -Sy --noconfirm archlinux-keyring
  '';

  setupScript = pkgs.writeShellScript "lazyspotify-setup.sh" ''
    exec > /home/${config.home.username}/lazyspotify-build.log 2>&1
    set -x

    export PATH=/usr/bin:/bin:$PATH

    echo "--> updating and getting tools"
    pacman -Syu --noconfirm git base-devel

    echo "--> building lazyspotify directly from AUR:"
    sudo -u ${config.home.username} bash -c '
      export PATH=/usr/bin:/bin:$PATH
      cd /tmp
      rm -rf lazyspotify-bin
      git clone https://aur.archlinux.org/lazyspotify-bin.git
      cd lazyspotify-bin
      makepkg -si --noconfirm
    '
  '';

in
lib.mkIf config.my.apps.lazyspotify {
  my.distrobox.enable = true;

  my.distrobox.containers."lazyspotify-arch" = {
    image = "ghcr.io/ublue-os/arch-distrobox:latest";
    pull = true;
    pre_init_hooks = "${preSetupScript}";
    init_hooks = "${setupScript}";
    exported_bins = "/usr/bin/lazyspotify";
  };
}
