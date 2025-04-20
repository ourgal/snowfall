{
  path = ./.;
  progs.wezterm.extraConfig = builtins.readFile ./config.lua;
}
