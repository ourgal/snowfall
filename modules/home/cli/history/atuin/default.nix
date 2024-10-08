{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      atuin = {
        settings = {
          enter_accept = true;
          sync_address = "http://atuin.zxc.cn";
          sync_frequency = "15m";
        };
      };
    };
  }
)
