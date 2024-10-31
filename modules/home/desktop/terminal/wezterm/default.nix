args:
args.module (
  args
  // {
    path = ./.;
    progs.wezterm.extraConfig = builtins.readFile ./config.lua;
  }
)
