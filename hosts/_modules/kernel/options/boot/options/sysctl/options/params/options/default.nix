{ ... }: {
  imports = [
    ./kernel.yama.ptrace_scope.nix
    ./net.ipv4.conf.all.accept_redirects.nix
    ./net.ipv4.conf.all.rp_filter.nix
    ./net.ipv4.conf.default.rp_filter.nix
    ./net.ipv4.icmp_echo_ignore_broadcasts.nix
    ./net.ipv4.tcp_syncookies.nix
    ./net.ipv6.conf.all.accept_redirects.nix
    ./vm.max_map_count.nix
    ./vm.swappiness.nix
  ];
}
