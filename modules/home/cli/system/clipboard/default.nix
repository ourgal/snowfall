{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    enable = "clipmenu";
    nixPkgs = [ "clipboard-jh" ];
  }
)
