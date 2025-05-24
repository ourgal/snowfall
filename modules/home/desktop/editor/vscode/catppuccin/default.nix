args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vscode.profiles.default = {
        extensions = [ pkgs.vscode-extensions.catppuccin.catppuccin-vsc ];
        userSettings = {
          "workbench.colorTheme" = "Catppuccin Mocha";
        };
      };
    }
  )
)
