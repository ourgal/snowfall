args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "miru";
    defaultApps."miru.desktop" = [ "x-scheme-handler/miru" ];
  }
)
