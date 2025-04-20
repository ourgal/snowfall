args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    time.timeZone = "Asia/Taipei";
    networking.timeServers = [ "pool.ntp.org" ];
  };
  _args = { inherit value args; };
in
nixosModule _args
