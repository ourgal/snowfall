{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    enable = "clipmenu";
    nixPkgs = [
      # keep-sorted start
      "clipboard-jh"
      "yank"
      # keep-sorted end
    ];
  }
)
