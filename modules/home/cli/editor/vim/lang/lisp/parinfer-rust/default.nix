{
  nixPkgs = "parinfer-rust-emacs";
  progs.vim = {
    plugins = "parinfer-rust";
    extraConfig = ./config.vim;
  };
}
