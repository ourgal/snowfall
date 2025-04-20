args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vscode = {
        extensions = [ pkgs.open-vsx.tamasfe.even-better-toml ];
      };
    }
  )
)
