{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
    in
    {
      path = ./.;
      progs = "go";
      nixPkgs = "gopls";
      env = {
        GO111MODULE = "on";
      } // lib.${namespace}.proxy.go;
    }
  )
)
