args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vscode = {
        extensions = [ pkgs.vscode-extensions.catppuccin.catppuccin-vsc ];
        userSettings = {
          "workbench.colorTheme" = "Catppuccin Mocha";
        };
      };
    }
  )
)
