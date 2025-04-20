args:
let
  inherit (args)
    namespace
    lib
    config
    pkgs
    ;
  inherit (lib.${namespace}) nixosModule enabled disabled;
  inherit (builtins) throw;
  user = config.${namespace}.user.name;
  isDocker = config.virtualisation.docker.enable;
  isPodman = config.virtualisation.podman.enable;
  value = {
    virtualisation = {
      docker = enabled // {
        autoPrune = enabled // {
          dates = "weekly";
        };
      };
      podman = disabled // {
        dockerCompat = true;
        dockerSocket = enabled;
        autoPrune = enabled // {
          dates = "weekly";
        };
      };
      oci-containers.backend =
        if isDocker then
          "docker"
        else if isPodman then
          "podman"
        else
          throw "unknow oci-containers backend";
      arion = {
        backend = "docker";
        package = pkgs.arion;
      };
    };
    users.users.${user}.extraGroups =
      if isDocker then
        [ "docker" ]
      else if isPodman then
        [ "podman" ]
      else
        throw "unknow containers backend";

    environment.systemPackages = lib.optional isDocker pkgs.docker-compose;
  };
  _args = { inherit value args; };
in
nixosModule _args
