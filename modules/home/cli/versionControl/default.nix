args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "lab";
    enable = [
      # keep-sorted start
      "gh"
      "git"
      "gitui"
      "lazygit"
      # keep-sorted end
    ];
  }
)
