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
        "lazygit"
        {
          git = {
            hook = enabled;
          };
        }
        # keep-sorted end
      ];
    }
  )
)
