{
  progs.emacs = {
    extraPackages = epkgs: [ epkgs.super-save ];
    extraConfig = builtins.readFile ./config.el;
  };
}
