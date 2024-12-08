args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        enableOpt
        pkgs
        namespace
        disableOpt
        ;
      sessionFile = "${config.xdg.dataHome}/aria2/session";
      configFile = "${config.xdg.configHome}/aria2/aria2.conf";
      aria2-session = pkgs.writeShellScript "aria2-session" ''
        sessionDir="$HOME/.local/share/aria2"
        sessionFile="$HOME/.local/share/aria2/session"
        if ! test -d "$sessionDir"; then
          mkdir -p "$sessionDir"
        fi
        if ! test -e "$sessionFile"; then
          touch "$sessionFile"
        fi
      '';
      source = pkgs._sources."aria2.conf".src;
    in
    {
      path = ./.;
      progs.aria2.settings =
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
        ]
        // disableOpt [
          "always-resume"
          "force-save"
          "reuse-uri"
          "allow-overwrite"
          "enable-dht6"
          "bt-seed-unverified"
          "pause-metadata"
          "enable-rpc"
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
          dht-file-path = "${config.xdg.configHome}/aria2/dht.dat";
          dht-file-path6 = "${config.xdg.configHome}/aria2/dht6.dat";
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
          # on-download-stop = "${config.xdg.configHome}/aria2/delete.sh";
          # on-download-complete = "${config.xdg.configHome}/aria2/clean.sh";
        };
      value = {
        xdg.configFile = {
          "aria2/delete.sh".source = source + "/delete.sh";
          "aria2/clean.sh".source = source + "/clean.sh";
          "aria2/tracker.sh".source = source + "/tracker.sh";
          "aria2/move.sh".source = source + "/move.sh";
          "aria2/upload.sh".source = source + "/upload.sh";
          "aria2/core".source = source + "/core";
          "aria2/dht.dat".source = source + "/dht.dat";
          "aria2/dht6.dat".source = source + "/dht6.dat";
          "aria2/script.conf".source = source + "/script.conf";
        };
        ${namespace}.dev.python.global.pkgs = (p: with p; [ aria2p ] ++ aria2p.optional-dependencies.tui);
        systemd.user.services.aria2 = {
          Unit = {
            Description = "Aria2 Service";
            Wants = "network-online.target";
            After = "network-online.target";
          };
          Service = {
            ExecStartPre = aria2-session;
            ExecStart = "${pkgs.aria2}/bin/aria2c --enable-rpc -d ${config.xdg.userDirs.download} --conf-path=${configFile} --save-session=${sessionFile} --input-file=${sessionFile} --on-download-stop='${config.xdg.configHome}/aria2/delete.sh' --on-download-complete='${config.xdg.configHome}/aria2/clean.sh'";
            ExecReload = "${pkgs.coreutils-full}/bin/kill -HUP $MAINPID";
            Restart = "on-abort";
          };
          Install = {
            WantedBy = [ "default.target" ];
          };
        };
      };
    }
  )
)
