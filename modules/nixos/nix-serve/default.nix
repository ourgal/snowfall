args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled;
  port = 50000;
  name = "nix-serve";
  value = {
    environment.etc = {
      "nix-serve/secret".source = ./secret;
    };
    services.nix-serve = enabled // {
      inherit port;
      secretKeyFile = "/etc/nix-serve/secret";
      package = pkgs.nix-serve-ng;
    };
    ${namespace} = {
      user.ports = [ port ];
      firehol.services = [
        {
          inherit name;
          tcp = port;
        }
      ];
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
