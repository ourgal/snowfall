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
