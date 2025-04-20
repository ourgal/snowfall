{
  progs.emacs = {
    extraPackages = epkgs: [ epkgs.persp-mode ];
    extraConfig = builtins.readFile ./config.el;
  };
}
