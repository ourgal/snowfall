{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "git-absorb"
      "git-instafix"
      # keep-sorted end
    ];
    progs = {
      git.extraConfig.absorb.autoStageIfNothingStaged = true;
    };
  }
)
