args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      inputPkgs = p: [ p.ulauncher.packages."${pkgs.system}".default ];
      myPkgs = "hyprkan";
      nixX86Pkgs = "rustdesk";
      nixPkgs = [
        # keep-sorted start
        "blobdrop"
        "hardinfo2"
        "polkit"
        "qtscrcpy"
        "remmina"
        "variety"
        "xcolor"
        "xmagnify"
        "zenity"
        # keep-sorted end
      ];
    }
  )
)
