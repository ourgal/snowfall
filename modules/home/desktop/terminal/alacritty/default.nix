{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      alacritty = {
        settings = {
          env.TERM = "xterm-256color";
          window.opacity = 0.8;
          font = {
            normal.family = "FiraCode Nerd Font";
            size = 14.0;
          };
        };
      };
    };
  }
)
