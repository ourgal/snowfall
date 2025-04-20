{
  progs.emacs = {
    extraPackages = epkgs: with epkgs; [ treesit-auto ];
    extraConfig = builtins.readFile ./config.el;
  };
}
