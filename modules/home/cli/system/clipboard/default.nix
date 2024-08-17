{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "clipmenu"
      "clipse"
      # keep-sorted end
    ];
    nixPkgs = "clipboard-jh";
  }
)
