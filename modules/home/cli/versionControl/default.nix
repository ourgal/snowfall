{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "gitu"
      "tig"
      "tokei"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "gh"
      "git"
      "gitui"
      "jujutsu"
      { lazygit.diff = "difftastic"; }
      # keep-sorted end
    ];
  }
)
