{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "blueman"
      "pavucontrol"
    ];
    myPkgs = [
      "icomoon"
      "jetbrains-mono"
    ];
    xfcePkgs = "thunar";
    confs = {
      awesome = [
        ./rc.lua
        ./configuration
        ./layout
        ./module
        ./sharedtags
        ./theme
        ./utilities
        ./widget
      ];
    };
  }
)
