args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vscode.profiles.default = {
        extensions = [ pkgs.nix-vscode-extensions.vscode-marketplace.pkief.material-icon-theme ];
        userSettings = {
          "workbench.iconTheme" = "material-icon-theme";
          "material-icon-theme.hidesExplorerArrows" = true;
        };
      };
    }
  )
)
