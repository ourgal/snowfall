args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.avahi = enabled // {
      nssmdns4 = true;
      publish = enabled // {
        addresses = true;
        workstation = true;
      };
    };
    networking.firewall = {
      allowedUDPPorts = [ 5353 ];
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
