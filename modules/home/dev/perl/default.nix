{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "perl"
      "perlnavigator"
    ];
    perlPkgs = "PerlTidy";
  }
)
