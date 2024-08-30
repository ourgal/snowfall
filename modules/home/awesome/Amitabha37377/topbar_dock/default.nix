{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "lxappearance"
      "networkmanagerapplet"
      "scrot"
      "xss-lock"
      # keep-sorted end
    ];
    confs = {
      awesome = [
        ./rc.lua
        ./overflow.lua
        ./fancy_taglist.lua
        ./binding
        ./deco
        ./layout
        ./main
        ./popups
        ./themes
        ./Wallpapers
      ];
    };
  }
)
