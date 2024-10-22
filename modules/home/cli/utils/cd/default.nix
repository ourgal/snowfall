args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "cdwe";
    enable = [
      # keep-sorted start
      "broot"
      "tere"
      "zoxide"
      # keep-sorted end
    ];
  }
)
