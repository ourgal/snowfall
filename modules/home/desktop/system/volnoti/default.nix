args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      servs.volnoti.package = pkgs.${namespace}.volnoti;
    }
  )
)
