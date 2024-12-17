args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "akuse";
    defaultApps."akuse-beta.desktop" = [ "x-scheme-handler/akuse" ];
  }
)
