{
  progs.emacs = {
    extraPackages = epkgs: [ epkgs.eldoc-box ];
    extraConfig = builtins.readFile ./config.el;
  };
}
