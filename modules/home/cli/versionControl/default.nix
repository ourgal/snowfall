{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) enabled;
    in
    {
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
        "gitui"
        "jujutsu"
        { git.hook = enabled; }
        { lazygit.diff = "difftastic"; }
        # keep-sorted end
      ];
    }
  )
)
