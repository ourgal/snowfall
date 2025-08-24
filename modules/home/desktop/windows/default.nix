args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      inputPkgs = p: [
        p.winapps.packages."${pkgs.system}".winapps
        p.winapps.packages."${pkgs.system}".winapps-launcher
      ];
      nixPkgs = [
        # keep-sorted start
        "dialog"
        "freerdp"
        # keep-sorted end
      ];
    }
  )
)
