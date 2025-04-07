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
      podman = enabled // {
        dockerCompat = true;
        dockerSocket = enabled;
        autoPrune = enabled // {
          dates = "weekly";
        };
        defaultNetwork.settings.dns_enabled = true;
      };
      oci-containers.backend = "podman";
    };
    users.users.${user}.extraGroups = [ "podman" ];

    environment.systemPackages = with pkgs; [
      podman-compose
      htop
    ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
