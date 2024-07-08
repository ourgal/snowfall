{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "contour";
    confs = {
      contour = ./contour.yml;
    };
  }
)
