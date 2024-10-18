args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      servs.screen-locker.lockCmd = "${pkgs.${namespace}.i3lock-color}/bin/i3lock-color";
    }
  )
)
