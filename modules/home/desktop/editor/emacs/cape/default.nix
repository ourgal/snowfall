{
  progs.emacs = {
    extraPackages = epkgs: [ epkgs.cape ];
    extraConfig = builtins.readFile ./config.el;
  };
}
