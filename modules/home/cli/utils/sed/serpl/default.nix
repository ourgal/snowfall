{
  nixPkgs = "serpl";
  confs."serpl/config.toml" = {
    keybindings = {
      "<Ctrl-q>" = "Quit";
    };
  };
}
