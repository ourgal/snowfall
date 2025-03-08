args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      inputPkgs = p: [ p.lem.packages."${pkgs.system}".default ];
    }
  )
)
