args:
args.module (
  args
  // (
    let
      inherit (args) config pkgs;
      ln = config.lib.file.mkOutOfStoreSymlink;
      dir = "${config.home.homeDirectory}/workspace/snowfall/modules/home/cli/file-manager/chezmoi/config";
    in
    {
      path = ./.;
      nixPkgs = "chezmoi";
      dataFiles = {
        chezmoi = ln dir;
      };
      value = {
        home.activation.chezmoi = config.lib.dag.entryAfter [ "reloadSystemd" ] ''
          ${pkgs.chezmoi}/bin/chezmoi apply --force
        '';
      };
    }
  )
)
