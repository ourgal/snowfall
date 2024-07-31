{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      eza = {
        git = true;
        icons = true;
        extraOptions = [
          "--group"
          "--group-directories-first"
          "--time-style"
          "relative"
        ];
      };
    };
  }
)
