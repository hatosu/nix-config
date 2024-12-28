{...}: {

  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    #trustedInterfaces = [ "enp0s2" ];
    #rejectPackets = false;
    #pingLimit = "--limit 1/minute --limit-burst 5";
    #filterForward = false;
    #allowPing = true;
    #connectionTrackingModules = [ "ftp" "irc" "sane" "sip" "tftp" "amanda" "h323" "netbios_sn" "pptp" "snmp" ];
    #checkReversePath = "loose";
    #autoLoadConntrackHelpers = false;
    #allowedUDPPorts = [ 53 ];
    #allowedUDPPortRanges = [ { from = 60000; to = 61000; } ];
    #allowedTCPPorts = [ 22 80 ];
    #allowedTCPPortRanges = [ { from = 8999; to = 9003; } ];
    #extraStopCommands = "iptables -P INPUT ACCEPT";
    #extraReversePathFilterRules = "fib daddr . mark . iif type local accept";
    #extraPackages = [ pkgs.ipset ];
    #extraInputRules = "ip6 saddr { fc00::/7, fe80::/10 } tcp dport 24800 accept";
    #extraForwardRules = "iifname wg0 accept";
    #extraCommands = "iptables -A INPUT -p icmp -j ACCEPT";
    #logReversePathDrops = false;
    #logRefusedUnicastsOnly = true;
    #logRefusedPackets = false;
    #logRefusedConnections = true;
    #interfaces."eth0" = {
    #allowedUDPPorts = [ 53 ];
    #allowedUDPPortRanges = [ { from = 60000; to = 61000; } ];
    #allowedTCPPorts = [ 22 80 ];
    #allowedTCPPortRanges = [ { from = 8999; to = 9003; } ];
    #};
  };

}
