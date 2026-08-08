{ pkgs, ... }: {
  # default
  default-kernel = pkgs.linuxPackages;
  hardened-kernel = pkgs.linuxPackages_hardened;
  latest-kernel = pkgs.linuxPackages_latest;
  libre-kernel = pkgs.linuxPackages-libre;
  testing-kernel = pkgs.linuxPackages_testing;

  # zen
  zen-kernel = pkgs.linuxPackages_zen;

  # cachyos
  cachyos-kernel = pkgs.linuxPackages_cachyos;
  cachyos-gcc-kernel = pkgs.linuxPackages_cachyos-gcc;
  cachyos-lts-kernel = pkgs.linuxPackages_cachyos-lts;
  cachyos-server-kernel = pkgs.linuxPackages_cachyos-server;
  cachyos-hardened-kernel = pkgs.linuxPackages_cachyos-hardened;

  # xanmod
  xanmod-default-kernel = pkgs.linuxPackages_xanmod;
  xanmod-latest-kernel = pkgs.linuxPackages_xanmod_latest;
  xanmod-stable-kernel = pkgs.linuxPackages_xanmod_stable;

  #xem_dom0
  xem_dom0-hardened-kernel = pkgs.linuxPackages_xen_dom0_hardened;
  xen_dom0-kernel = pkgs.linuxPackages_xen_dom0;
}
