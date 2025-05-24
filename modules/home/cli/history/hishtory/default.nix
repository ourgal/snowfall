{
  nixPkgs = "hishtory";
  progs = {
    fish.interactiveShellInit = builtins.readFile ./config.fish;
    zsh.initContent = builtins.readFile ./config.zsh;
  };
}
