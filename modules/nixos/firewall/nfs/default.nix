args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  ports = [
    # rpcinfo -p
    111 # portmapper
    2049 # nfs
    20048 # mountd
  ];
  value = {
    networking.firewall = {
      allowedTCPPorts = ports ++ [
        36789 # nlockmgr
      ];
      allowedUDPPorts = ports ++ [
        54598 # nlockmgr
      ];
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
