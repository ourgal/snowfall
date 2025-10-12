{
  nixPkgs = "universal-ctags";
  progs.vim = {
    plugins = "tagbar";
    extraConfig = ./config.vim;
  };
}
