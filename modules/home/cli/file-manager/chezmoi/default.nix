args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        pkgs
        lib
        switch
        namespace
        cfgHome
        ;
      ln = config.lib.file.mkOutOfStoreSymlink;
      dir = "${config.home.homeDirectory}/workspace/snowfall/modules/home/cli/file-manager/chezmoi/config";
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      nixPkgs = "chezmoi";
      dataFiles = if cfg.link.enable then { chezmoi = ln dir; } else { };
      value = {
        home.activation.chezmoi =
          if cfg.link.enable then
            config.lib.dag.entryAfter [ "reloadSystemd" ] ''
              PATH=$PATH:${
                lib.makeBinPath [
                  pkgs.gnumake
                  pkgs.git
                  pkgs.fnlfmt
                  pkgs.luaPackages.fennel
                ]
              }
              ${lib.getExe pkgs.chezmoi} apply --force
            ''
          else
            "";
      };
      extraOpts = {
        link = switch;
      };
    }
  )
)
