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
        "go-errorlint"
        "go-import-lint"
        "go-tools"
        "goconst"
        "gofumpt"
        "golangci-lint"
        "golint"
        "gopls"
        "goverter"
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
