{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "posting";
    nixPkgs = [
      "curlie"
      "htmlq"
      "httpie"
      "xh"
    ];
  }
)
