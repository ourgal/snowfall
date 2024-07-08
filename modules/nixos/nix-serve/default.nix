{ ... }@args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    environment.etc = {
      "nix-serve/secret".source = ./secret;
    };
    services.nix-serve = enabled // {
      port = 50000;
      secretKeyFile = "/etc/nix-serve/secret";
      package = pkgs.nix-serve-ng;
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
