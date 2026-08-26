{ config, lib, ... }:
let
  cfg = config.custom.kernel.boot.sysctl.profiles.security-nomad;
in
{
  # imports = [
  #   ../../params/default.nix
  # ];

  options.custom.kernel.boot.sysctl.profiles.security-nomad.enable =
    lib.mkEnableOption "security-nomad sysctl profile";

  config = lib.mkIf cfg.enable {
    custom.kernel.boot.sysctl.params = {
      # very aggressive swapping
      vm.swappiness = lib.mkDefault 100;

      # avoids smurf attacks
      net.ipv4.icmp_echo_ignore_broadcasts = 1;

      # syn flood attacks
      net.ipv4.tcp_syncookies = 1;

      # enables strict reverse path filtering
      # kernel checks for arriving packets matching the routing table's expected path back to the sender
      # this drops packets with spoofed source ip addresses tldr
      net.ipv4.conf.all.rp_filter = 1;
      net.ipv4.conf.default.rp_filter = 1;

      # disabled icmp redirects
      # helps avoid some mitm
      net.ipv4.conf.all.accept_redirects = 0;
      net.ipv6.conf.all.accept_redirects = 0;

      # restricts ptrace system call so a process can only inspect/modify its children's memories
      # this prevents a compromised app from injecting into things
      kernel.yama.ptrace_scope = 1;
    };
  };
}
