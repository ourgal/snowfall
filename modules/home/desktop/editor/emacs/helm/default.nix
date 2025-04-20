{
  progs.emacs = {
    extraPackages = epkgs: [ epkgs.helm ];
    extraConfig = builtins.readFile ./config.el;
  };
}
