{
  progs.vim = {
    plugins = "wiki-vim";
    extraConfig = builtins.readFile ./config.vim;
  };
}
