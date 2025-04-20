args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.texlive.packageSet = pkgs.texlineFull;
    }
  )
)
