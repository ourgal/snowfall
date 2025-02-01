args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  lightnovel = [
    "2606:4700:20:0:0:0:681a:c0"
    "2606:4700:20:0:0:0:681a:1c0"
    "2606:4700:20:0:0:0:ac43:46ba"
    "172.67.70.186"
    "104.26.0.192"
    "104.26.1.192"
  ];
  lightnovelHosts = builtins.foldl' (
    acc: x:
    acc
    // {
      ${x} =
        let
          domain = "lightnovel.us";
        in
        [
          "www.${domain}"
          "res.${domain}"
        ];
    }
  ) { } lightnovel;
  value = {
    networking.hosts = lightnovelHosts;
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
