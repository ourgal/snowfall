{
  progs.emacs = {
    extraPackages = epkgs: [ epkgs.editorconfig ];
    extraConfig = builtins.readFile ./config.el;
  };
}
