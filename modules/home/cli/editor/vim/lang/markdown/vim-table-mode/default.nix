{
  progs.vim = {
    plugins = "table-mode";
    extraConfig = builtins.readFile ./config.vim;
  };
}
