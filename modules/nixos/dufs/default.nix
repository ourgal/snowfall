args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace})
    nixosModule
    domains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  user = config.${namespace}.user.name;
  port = 5001;
  User = user;
  name = getDirname path;
  ExecStart = pkgs.writers.writeBash "dufs-start" ''
    dir="/home/${user}/.local/share/dufs"
    mkdir -p "$dir"
    ${pkgs.dufs}/bin/dufs -A -p ${toString port} "$dir"
  '';
  value = {
    systemd.services.dufs = {
      description = "Dufs service";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Restart = "on-failure";
        inherit User ExecStart;
      };
    };
    services.caddy = mkCaddyProxy {
      domain = domains.${name};
      inherit port;
    };
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = port;
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
