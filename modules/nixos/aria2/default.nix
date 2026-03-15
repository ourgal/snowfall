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
    enableOpt
    disableOpt
    ;
  user = config.${namespace}.user.name;
  dataHome = "/var/lib/aria2";
  value = {
    services.aria2 = enabled // {
      rpcSecretFile = pkgs.writeText "secret" "654321";
      serviceUMask = "002";
      openPorts = true;
      settings =
        enableOpt [
          "continue"
          "remote-time"
          "allow-piece-length-change"
          "disable-ipv6"
          "http-accept-gzip"
          "no-netrc"
          "auto-file-renaming"
          "content-disposition-default-utf8"
          "enable-dht"
          "bt-enable-lpd"
          "enable-peer-exchange"
          "bt-hash-check-seed"
          "rpc-save-upload-metadata"
          "follow-torrent"
          "bt-save-metadata"
          "bt-load-saved-metadata"
          "bt-remove-unselected-file"
          "bt-force-encryption"
          "bt-detach-seed-only"
          "rpc-allow-origin-all"
          "rpc-listen-all"
          "enable-http-pipelining"
          "enable-rpc"
          "enable-dht6"
        ]
        // disableOpt [
          "always-resume"
          "force-save"
          "reuse-uri"
          "allow-overwrite"
          "bt-seed-unverified"
          "pause-metadata"
          "quiet"
        ]
        // {
          # dir = config.xdg.userDirs.download;
          disk-cache = "64M";
          file-allocation = "none";
          no-file-allocation-limit = "64M";
          max-resume-failure-tries = 0;
          save-session-interval = 1;
          auto-save-interval = 20;
          max-file-not-found = 10;
          max-tries = 0;
          retry-wait = 10;
          connect-timeout = 10;
          timeout = 10;
          max-concurrent-downloads = 5;
          max-connection-per-server = 16;
          split = 64;
          min-split-size = "4M";
          piece-length = "1M";
          lowest-speed-limit = 0;
          max-overall-download-limit = 0;
          max-download-limit = 0;
          dht-file-path = "${dataHome}/dht.dat";
          dht-file-path6 = "${dataHome}/dht6.dat";
          dht-entry-point = "dht.transmissionbt.com:6881";
          dht-entry-point6 = "dht.transmissionbt.com:6881";
          bt-max-peers = 128;
          bt-request-peer-speed-limit = "10M";
          max-overall-upload-limit = "2M";
          max-upload-limit = 0;
          seed-ratio = 1.0;
          seed-time = 0;
          bt-tracker-connect-timeout = 10;
          bt-tracker-timeout = 10;
          bt-prioritize-piece = "head=32M,tail=32M";
          user-agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36 Edg/93.0.961.47";
          peer-agent = "Deluge 1.3.15";
          peer-id-prefix = "-DE13F0-";
          rpc-listen-port = 6800;
          rpc-max-request-size = "10M";
          console-log-level = "warn";
          summary-interval = 0;
        };
    };
    users.users.${user}.extraGroups = [ "aria2" ];
  };
  _args = { inherit value args; };
in
nixosModule _args
