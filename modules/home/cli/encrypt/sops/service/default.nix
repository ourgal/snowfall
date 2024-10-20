args:
args.module (
  args
  // (
    let
      inherit (args)
        lib
        config
        namespace
        pkgs
        ;
    in
    {
      path = ./.;
      value = {
        systemd.user.services.udiskie = {
          Unit.Before = [ "sops-nix.service" ];
          Service.ExecStart = lib.mkForce ''${pkgs.udiskie}/bin/udiskie --notify-command "${
            pkgs.${namespace}.udiskie-sops-nix
          }/bin/udiskie-sops-nix"'';
        };
        xdg.configFile = {
          "sops/age/keys.txt".source = config.lib.file.mkOutOfStoreSymlink /media/key/keys.txt;
        };
      };
    }
  )
)
