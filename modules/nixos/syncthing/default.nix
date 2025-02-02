args:
let
  inherit (args)
    namespace
    lib
    config
    pkgs
    ;
  inherit (lib.${namespace})
    nixosModule
    enabled
    mkSyncthingFolders
    domains
    ;
  inherit (lib.${namespace}.settings.servers) syncthing;
  inherit (lib.${namespace}.settings) desktops;
  inherit (config.${namespace}.user) host;
  inherit (lib.${namespace}.syncthing) devices folders;

  isDesktop = builtins.elem host desktops;
  user = if isDesktop then config.${namespace}.user.name else "syncthing";
  group = if isDesktop then "users" else "syncthing";
  dataDir = if isDesktop then "/home/${user}/.local/share/syncthing" else "/var/lib/syncthing";
  port = 8384;
  guiAddress = "0.0.0.0:${toString port}";
  updateConfig = pkgs.writers.writeBash "update-syncthing-config" ''
    set -efu

    # be careful not to leak secrets in the filesystem or in process listings
    umask 0077

    curl() {
        # get the api key by parsing the config.xml
        while
            ! ${pkgs.libxml2}/bin/xmllint \
                --xpath 'string(configuration/gui/apikey)' \
                ${config.services.syncthing.configDir}/config.xml \
                >"$RUNTIME_DIRECTORY/api_key"
        do sleep 1; done
        (printf "X-API-Key: "; cat "$RUNTIME_DIRECTORY/api_key") >"$RUNTIME_DIRECTORY/headers"
        ${pkgs.curl}/bin/curl -sSLk -H "@$RUNTIME_DIRECTORY/headers" \
            --retry 1000 --retry-delay 1 --retry-all-errors \
            "$@"
    }
    curl -X PUT -d '{"path":"${dataDir}"}' http://${guiAddress}/rest/config/defaults/folder
  '';
  value = {
    sops.secrets."syncthing/${host}/key".owner = user;
    sops.secrets."syncthing/${host}/cert".owner = user;
    services.syncthing = enabled // {
      inherit user group guiAddress;
      key = config.sops.secrets."syncthing/${host}/key".path;
      cert = config.sops.secrets."syncthing/${host}/cert".path;
      inherit dataDir;
      configDir = if isDesktop then "/home/${user}/.config/syncthing" else "${dataDir}/.config/syncthing";
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
        folders = mkSyncthingFolders { inherit dataDir host folders; };
      };
    };

    systemd.services.syncthing-init.serviceConfig.ExecStartPost =
      if isDesktop then updateConfig else "";

    services.caddy = lib.mkIf (builtins.elem host syncthing) {
      enable = true;
      virtualHosts = {
        "http://${domains.syncthing}".extraConfig = ''
          reverse_proxy http://localhost:${toString port}
        '';
      };
    };

    systemd.tmpfiles.rules =
      if !isDesktop then
        let
          mode = "2770";
        in
        [ "e ${dataDir} ${mode} ${user} ${group} - -" ]
        ++ (builtins.map (x: "e ${dataDir}/${x} ${mode} ${user} ${group} - -") (builtins.attrNames folders))
      else
        [ ];

    users.users.${user}.extraGroups = if isDesktop then [ "syncthing" ] else [ ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
