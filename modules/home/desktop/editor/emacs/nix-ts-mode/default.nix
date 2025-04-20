{
  path = ./.;
  progs.emacs = {
    extraPackages = epkgs: with epkgs; [ nix-ts-mode ];
    extraConfig = builtins.readFile ./config.el;
  };
}
