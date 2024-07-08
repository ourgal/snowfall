{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "gitu"
      "tig"
      "tokei"
    ];
    enable = [
      "git"
      "jujutsu"
      "lazygit"
    ];
  }
)
