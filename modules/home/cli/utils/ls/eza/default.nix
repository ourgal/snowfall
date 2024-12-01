args:
args.module (
  args
  // {
    path = ./.;
    progs.eza = {
      git = true;
      icons = "auto";
      extraOptions = [
        "--group"
        "--group-directories-first"
        "--time-style"
        "relative"
      ];
    };
  }
)
