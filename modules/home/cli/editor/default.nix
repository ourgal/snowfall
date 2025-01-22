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
      myPkgs = "v";
      nixPkgs = [
        # keep-sorted start
        "micro"
        "ox"
        "vimer"
        "vis"
        # keep-sorted end
      ];
      enable = [
        # keep-sorted start
        "helix"
        "kakoune"
        "ki"
        "nixvim"
        "vim"
        # keep-sorted end
      ];
    }
  )
)
