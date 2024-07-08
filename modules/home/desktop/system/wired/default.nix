{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    servs = {
      wired = {
        config = ./wired.ron;
      };
    };
  }
)
