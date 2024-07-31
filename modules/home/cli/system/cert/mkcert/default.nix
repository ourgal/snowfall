{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "mkcert";
    dataFiles = {
      mkcert = ./rootCA.pem.key;
    };
  }
)
