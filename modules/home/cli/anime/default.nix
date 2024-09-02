{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "adl"
      "animdl"
      "lobster"
      # keep-sorted end
    ];
    enable = "trackma";
  }
)
