args:
let
  inherit (args)
    namespace
    lib
    config
    pkgs
    ;
  inherit (lib.${namespace}) nixosModule enabled;
  user = config.${namespace}.user.name;
  value = {
    virtualisation = {
      docker = enabled // {
        autoPrune = enabled // {
          dates = "weekly";
        };
      };
      oci-containers.backend = "docker";
      arion = {
        backend = "docker";
        package = pkgs.arion;
      };
    };
    users.users.${user}.extraGroups = [ "docker" ];

    environment.systemPackages = with pkgs; [ docker-compose ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
