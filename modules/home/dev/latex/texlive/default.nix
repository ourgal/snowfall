args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      progs.texlive.packageSet = pkgs.texlineFull;
    }
  )
)
