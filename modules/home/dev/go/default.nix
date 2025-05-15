args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
    in
    {
      progs = "go";
      nixPkgs = [
        # keep-sorted start
        "go-tools"
        "golint"
        "gopls"
        "unparam"
        # keep-sorted end
      ];
      env = {
        GO111MODULE = "on";
      } // lib.${namespace}.proxy.go;
    }
  )
)
