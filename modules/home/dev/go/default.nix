args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
    in
    {
      path = ./.;
      progs = "go";
      nixPkgs = [
        # keep-sorted start
        "golint"
        "gopls"
        # keep-sorted end
      ];
      env = {
        GO111MODULE = "on";
      } // lib.${namespace}.proxy.go;
    }
  )
)
