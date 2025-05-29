{
  nixPkgs = "opencc";
  progs.doom-emacs.extraPackages = epkgs: [ epkgs.chinese-conv ];
}
