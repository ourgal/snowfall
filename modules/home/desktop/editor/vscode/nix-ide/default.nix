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
        extensions = [ pkgs.open-vsx.jnoortheen.nix-ide ];
        userSettings = {
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nil";
        };
      };
    }
  )
)
