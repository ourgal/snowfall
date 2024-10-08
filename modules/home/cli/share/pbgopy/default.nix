{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    servs = "pbgopy";
    env = {
      PBGOPY_SERVER = "http://surface.local:9090";
    };
  }
)
