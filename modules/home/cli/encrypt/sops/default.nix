args:
args.module (
  args
  // (
    let
      inherit (args)
        lib
        host
        config
        namespace
        pkgs
        ;
    in
    {
      path = ./.;
      nixPkgs = "sops";
      value = {
        sops = {
          age.keyFile = "/media/key/keys.txt";
          defaultSopsFile = lib.snowfall.fs.get-file "secrets/${config.${namespace}.user.name}/default.yaml";
          secrets =
            if (host == "surface") then
              {
                "ssh/surface/private" = {
                  mode = "0600";
                  path = "${config.home.homeDirectory}/.ssh/id_ed25519";
                };
                "ssh/surface/public" = {
                  mode = "0644";
                  path = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
                };
              }
            else
              {
                "ssh/home/private" = {
                  mode = "0600";
                  path = "${config.home.homeDirectory}/.ssh/id_ed25519";
                };
                "ssh/home/public" = {
                  mode = "0644";
                  path = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
                };
              };
        };
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
