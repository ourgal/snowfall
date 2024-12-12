args:
let
  inherit (args)
    namespace
    lib
    config
    pkgs
    ;
  inherit (lib.${namespace}) nixosModule enabled mkSyncthingFolders;
  user = config.${namespace}.user.name;
  inherit (config.${namespace}.user) host;
  dataDir = "~/.local/share/syncthing";
  guiAddress = "0.0.0.0:8384";
  devices = {
    brix = {
      id = "SAFK7DR-JSFF3DS-6TCELEO-LX6TBQB-GHEDH7U-K376ZO3-4W56FPA-AI34CA3";
      autoAcceptFolders = true;
    };
    home = {
      id = "B7GGOHW-ZOIRPZD-7ZE5MRQ-M55IKVP-US7BZH3-T6UXXKG-J3COIN2-RZALYAO";
      autoAcceptFolders = true;
    };
    surface = {
      id = "R3A5ZU7-22YYIX5-GARMIR7-IK7BWRP-WDXVDCT-7GQLKKZ-AYZU55X-KYN54QS";
      autoAcceptFolders = true;
    };
    air = {
      id = "ZUFZMMQ-GQCZNZG-CJJLM6C-ZAQ3N72-DDB7UWG-557BNYG-BF7JDH2-DVDWYAR";
      autoAcceptFolders = true;
    };
    nuc = {
      id = "C2Z5Q2H-F5EGNLP-P5XHXUN-S6EIDTY-IKJSTGJ-VJVMMO5-YQXI7ZF-227QKAX";
      autoAcceptFolders = true;
    };
  };
  folders =
    let
      inherit (lib.${namespace}.settings) desktops;
      inherit (lib.${namespace}.settings.servers) syncthing;
    in
    {
      doom = desktops ++ syncthing;
      lazyvim = desktops ++ syncthing;
      lvim = desktops ++ syncthing;
      music_download_dl = desktops ++ syncthing;
      nap = desktops ++ syncthing;
      task = desktops ++ syncthing;
      todo = desktops ++ syncthing;
      vim = desktops ++ syncthing;
      buku = desktops ++ syncthing;
      jrnl = desktops ++ syncthing;
      books = [ "home" ] ++ syncthing;
      wenku = [ "home" ] ++ syncthing;
      linovel = [ "home" ] ++ syncthing;
      gal-save = [ "nuc" ] ++ syncthing;
      game-save = [ "nuc" ] ++ syncthing;
    };
  value = {
    sops.secrets."syncthing/${host}/key".owner = user;
    sops.secrets."syncthing/${host}/cert".owner = user;
    services.syncthing = enabled // {
      inherit user guiAddress;
      dataDir = "/home/${user}";
      key = "/run/secrets/syncthing/${host}/key";
      cert = "/run/secrets/syncthing/${host}/cert";
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
    systemd.services.syncthing-init2 =
      let
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
      in
      {
        description = "Syncthing configuration updater";
        requisite = [ "syncthing.service" ];
        after = [ "syncthing-init.service" ];
        wantedBy = [ "multi-user.target" ];

        serviceConfig = {
          User = user;
          RemainAfterExit = true;
          RuntimeDirectory = "syncthing-init2";
          Type = "oneshot";
          ExecStart = updateConfig;
        };
      };
    services.caddy =
      let
        inherit (config.${namespace}.user.duckdns) token domain;
        inherit (lib.${namespace}) domains;
        inherit (lib.${namespace}.settings) servers;
      in
      lib.mkIf (builtins.elem host servers.syncthing) {
        enable = true;
        virtualHosts = {
          "http://${domains.syncthing}".extraConfig = ''
            reverse_proxy http://localhost:8384
          '';
          "syncthing.${domain}.duckdns.org".extraConfig = ''
            tls {
                dns duckdns ${token}
            }
            reverse_proxy http://localhost:8384
          '';
        };
      };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
