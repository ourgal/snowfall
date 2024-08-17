{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "clipcat"
      "clipmenu"
      "clipse"
      # keep-sorted end
    ];
    nixPkgs = "clipboard-jh";
  }
)
