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
        "errcheck"
        "go-critic"
        "go-tools"
        "golangci-lint"
        "golint"
        "gopls"
        "revive"
        "unparam"
        # keep-sorted end
      ];
      env = {
        GO111MODULE = "on";
      } // lib.${namespace}.proxy.go;
    }
  )
)
