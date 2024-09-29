{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "adl"
      "animdl"
      "curd"
      "lobster"
      # keep-sorted end
    ];
    enable = "trackma";
  }
)
