args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    time.timeZone = "Asia/Taipei";
    networking.timeServers = [ "pool.ntp.org" ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
