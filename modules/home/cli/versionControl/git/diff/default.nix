{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "riffdiff"
      "ydiff"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "diffnav"
      # keep-sorted end
    ];
    progs = {
      fish.functions.diffnav = {
        body = "git diff | command diffnav";
        description = "Diffnav";
      };
    };
    enable = "diff-so-fancy";
  }
)
