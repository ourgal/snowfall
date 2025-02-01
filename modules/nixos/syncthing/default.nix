args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    mkSyncthingFolders
    domains
    ;
  inherit (lib.${namespace}.settings.servers) syncthing;
  inherit (config.${namespace}.user) host;
  inherit (lib.${namespace}.syncthing) devices folders;
  user = config.${namespace}.user.name;
  port = 8384;
  guiAddress = "0.0.0.0:${toString port}";
  value = {
    sops.secrets."syncthing/${host}/key".owner = "syncthing";
    sops.secrets."syncthing/${host}/cert".owner = "syncthing";
    services.syncthing = enabled // {
      inherit guiAddress;
      key = config.sops.secrets."syncthing/${host}/key".path;
      cert = config.sops.secrets."syncthing/${host}/cert".path;
      extraFlags = [ "--no-default-folder" ];
      openDefaultPorts = true;
      settings = {
        gui = {
          insecureAdminAccess = true;
        };
        options = {
          relaysEnabled = true;
          natEnabled = true;
          localAnnounceEnabled = true;
          localAnnouncePort = 21027;
          urAccepted = -1;
        };
        devices = lib.attrsets.filterAttrs (n: _: n != host) devices;
        folders = mkSyncthingFolders { inherit host folders; };
      };
    };
    services.caddy = lib.mkIf (builtins.elem host syncthing) {
      enable = true;
      virtualHosts = {
        "http://${domains.syncthing}".extraConfig = ''
          reverse_proxy http://localhost:${toString port}
        '';
      };
    };
    systemd.tmpfiles.rules =
      let
        mode = "2770";
        dir = "/var/lib/syncthing";
      in
      [ "e ${dir} ${mode} - - - -" ]
      ++ (builtins.map (x: "e ${dir}/${x} ${mode} - - - -") (builtins.attrNames folders));
    users.users.${user}.extraGroups = [ "syncthing" ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
