args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace}) nixosModule enabled domains;
  user = config.${namespace}.user.name;
  port = 5001;
  User = "zxc";
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
    services.caddy = enabled // {
      virtualHosts = {
        "http://${domains.dufs}".extraConfig = ''
          reverse_proxy http://localhost:${toString port}
        '';
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
