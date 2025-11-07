args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        pkgs
        disabled
        namespace
        lib
        ;
      ln = config.lib.file.mkOutOfStoreSymlink;
      sync = "${config.xdg.dataHome}/syncthing";
      stc = lib.${namespace}.wrapper-manager.wrapWith pkgs {
        basePackage = pkgs.stc-cli;
        prependFlags = [
          "--homedir"
          "${config.xdg.configHome}/syncthing"
        ];
      };
    in
    {
      nixPkgs = _: [ stc ];
      confs = {
        todo = ln "${sync}/todo";
      };
      dataFiles = {
        timewarrior = ln "${sync}/timew";
        nap = ln "${sync}/nap";
        jrnl = ln "${sync}/jrnl";
        "task/taskchampion.sqlite3" = ln "${sync}/task/taskchampion.sqlite3";
      };
      files = {
        Music = ln "${sync}/music";
        Documents = ln "${sync}/documents";
      };
      servs.syncthing = disabled // {
        # inherit guiAddress;
        # key = config.sops.secrets."syncthing/${host}/key".path;
        # cert = config.sops.secrets."syncthing/${host}/cert".path;
        extraOptions = [ "--no-default-folder" ];
        # openDefaultPorts = true;
        # settings = {
        #   gui = {
        #     insecureAdminAccess = true;
        #   };
        #   options = {
        #     relaysEnabled = true;
        #     natEnabled = true;
        #     localAnnounceEnabled = true;
        #     localAnnouncePort = 21027;
        #     urAccepted = -1;
        #   };
        #   devices = lib.attrsets.filterAttrs (n: _: n != host) devices;
        #   folders = mkSyncthingFolders { inherit host folders; };
        # };
      };
      # value = {
      #   systemd.user.syncthing-init.Service.ExecStartPost = updateConfig;
      #   sops.secrets = {
      #     "syncthing/${host}/key".mode = "0400";
      #     "syncthing/${host}/cert".mode = "0400";
      #   };
      # };
    }
  )
)
