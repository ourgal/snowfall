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
        extensions = [ pkgs.open-vsx.tamasfe.even-better-toml ];
      };
    }
  )
)
