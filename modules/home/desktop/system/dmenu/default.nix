args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "dmenu";
    files.".local/bin" = [
      ./colors
      ./def-dmenu
      ./def-nmdmenu
      ./def-ssdmenu
      ./powermenu
    ];
  }
)
