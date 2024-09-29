{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = "go";
    nixPkgs = "gopls";
    env = {
      GO111MODULE = "on";
      GOPROXY = "https://goproxy.cn";
    };
  }
)
