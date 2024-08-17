{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "clipcat"
      "clipmenu"
      # keep-sorted end
    ];
  }
)
