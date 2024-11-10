args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      progs.vscode = {
        extensions = [ pkgs.vscode-extensions.catppuccin.catppuccin-vsc ];
        userSettings = {
          "workbench.colorTheme" = "Catppuccin Mocha";
        };
      };
    }
  )
)
