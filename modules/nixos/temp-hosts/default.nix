args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  inherit (builtins) foldl';
  cloudflare = [
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
          domains = [
            "lightnovel.us"
            "lightnovel.fun"
          ];
        in
        foldl' (
          acc: v:
          acc
          ++ [
            "www.${v}"
            "res.${v}"
            "api.${v}"
          ]
        ) [ ] domains;
    }
  ) { } cloudflare;
  value = {
    networking.hosts = lightnovelHosts;
  };
  _args = { inherit value args; };
in
nixosModule _args
