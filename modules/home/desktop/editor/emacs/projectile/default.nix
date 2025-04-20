{
  progs.emacs = {
    extraPackages = epkgs: [ epkgs.projectile ];
    extraConfig = builtins.readFile ./config.el;
  };
}
