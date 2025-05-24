args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vscode.profiles.default = {
        extensions = [ pkgs.open-vsx.tamasfe.even-better-toml ];
      };
    }
  )
)
