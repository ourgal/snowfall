{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "todo-txt-cli"
      "ttdl"
    ];
    files = {
      ".todo" = ./config;
    };
  }
)
