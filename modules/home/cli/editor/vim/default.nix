{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "vim-full";
    dataFiles = {
      "vim/.keep" = "";
    };
  }
)
