{
  path = ./.;
  progs.emacs = {
    extraPackages = epkgs: [ epkgs.melpaPackages.telega ];
  };
}
