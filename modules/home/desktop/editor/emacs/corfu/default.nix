{
  progs.emacs = {
    extraPackages = epkgs: [
      epkgs.corfu
      epkgs.nerd-icons-corfu
    ];
    extraConfig = builtins.readFile ./config.el;
  };
}
