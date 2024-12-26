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
      "jujutsu"
      "lazygit"
      # keep-sorted end
    ];
  }
)
