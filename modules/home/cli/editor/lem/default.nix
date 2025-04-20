args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      inputPkgs = p: [ p.lem.packages."${pkgs.system}".default ];
    }
  )
)
