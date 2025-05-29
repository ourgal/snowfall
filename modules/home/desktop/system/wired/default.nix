args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      servs.wired = {
        config = ./wired.ron;
        package = pkgs.wired;
      };
    }
  )
)
