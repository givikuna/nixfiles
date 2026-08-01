{ ... }: {
  imports = [
    ./options/default-kernel.nix
    ./options/hardened-kernel.nix
    ./options/latest-kernel.nix
    ./options/libre-kernel.nix
    ./options/testing-kernel.nix
    ./options/xanmod-default-kernel.nix
    ./options/xanmod-latest-kernel.nix
    ./options/xanmod-stable-kernel.nix
    ./options/xen_dom0-hardened.nix
    ./options/xen_dom0.nix
    ./options/zen-kernel.nix
  ];
}
