{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "buku"
      "bukubrow"
    ];
    progs = {
      fish = {
        shellAbbrs = {
          bb = "buku";
        };
      };
    };
  }
)
