args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      inputPkgs = p: [ p.doxx.packages."${pkgs.system}".default ];
    }
  )
)
