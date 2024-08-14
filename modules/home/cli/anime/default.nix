{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "adl"
      "animdl"
      # keep-sorted end
    ];
    enable = "trackma";
  }
)
