{
  progs.emacs = {
    extraPackages = epkgs: [ epkgs.fzf ];
    extraConfig = builtins.readFile ./config.el;
  };
}
