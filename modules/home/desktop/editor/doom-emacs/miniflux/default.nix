args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.doom-emacs.extraPackages = _: [ pkgs.${namespace}.emacs-miniflux ];
    }
  )
)
