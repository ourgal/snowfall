args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vscode.profiles.default = {
        extensions = [ pkgs.open-vsx.jnoortheen.nix-ide ];
        userSettings = {
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nil";
        };
      };
    }
  )
)
