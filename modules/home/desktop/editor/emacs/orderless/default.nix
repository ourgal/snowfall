{
  path = ./.;
  progs.emacs = {
    extraPackages = epkgs: [ epkgs.orderless ];
    extraConfig = builtins.readFile ./config.el;
  };
}
