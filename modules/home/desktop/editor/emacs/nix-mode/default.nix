{
  path = ./.;
  progs.emacs = {
    extraPackages = epkgs: with epkgs; [ nix-mode ];
    extraConfig = builtins.readFile ./config.el;
  };
}
