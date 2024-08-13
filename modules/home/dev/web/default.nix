{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "posting";
    nixPkgs = [
      # keep-sorted start
      "curlie"
      "goaccess" # web log viewer
      "htmlq"
      "httpie"
      "xh"
      # keep-sorted end
    ];
  }
)
