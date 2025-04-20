{
  path = ./.;
  progs.emacs = {
    extraPackages = epkgs: [ epkgs.ligature ];
    extraConfig = builtins.readFile ./config.el;
  };
}
