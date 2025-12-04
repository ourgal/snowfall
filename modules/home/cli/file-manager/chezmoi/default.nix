args:
args.module (
  args
  // (
    let
      inherit (args) config pkgs lib;
      ln = config.lib.file.mkOutOfStoreSymlink;
      dir = "${config.home.homeDirectory}/workspace/snowfall/modules/home/cli/file-manager/chezmoi/config";
    in
    {
      nixPkgs = "chezmoi";
      dataFiles = {
        chezmoi = ln dir;
      };
      value = {
        home.activation.chezmoi = config.lib.dag.entryAfter [ "reloadSystemd" ] ''
          PATH=$PATH:${
            lib.makeBinPath [
              pkgs.gnumake
              pkgs.git
              pkgs.fnlfmt
              pkgs.luaPackages.fennel
            ]
          }
          ${lib.getExe pkgs.chezmoi} apply --force
        '';
      };
    }
  )
)
