args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "posting";
    nixPkgs = [
      # keep-sorted start
      "atac"
      "curlie"
      "goaccess" # web log viewer
      "htmlq"
      "httpie"
      "minify"
      "restish"
      "slumber"
      "trurl"
      "xh"
      # keep-sorted end
    ];
  }
)
