{
  path = ./.;
  progs.emacs = {
    extraPackages = epkgs: [ epkgs.helpful ];
  };
}
