args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace})
    nixosModule
    enableOpt
    disabled
    enabled
    ;
  value = {
    nix =
      let
        mirrors = [ "https://cache.nixos.org?priority=100" ];
      in
      {
        settings = enableOpt [ "auto-optimise-store" ] // {
          experimental-features = [
            "nix-command"
            "flakes"
            "pipe-operators"
          ];
          substituters = lib.mkBefore mirrors;
          trusted-public-keys = [ "cache.example.org-1:lFI4YUR1ZKE8dz1JoXTRBvIEHaeKmW3LHBlDTJDW1V8=" ];
          trusted-users = [ config.${namespace}.user.name ];
        };
        gc =
          lib.mkIf (!config.${namespace}.nh.enable) {
            dates = "weekly";
            options = "--delete-older-than 7d";
          }
          // enableOpt [ "automatic" ];
      };

    nixpkgs.config.allowUnfree = true;
    system.activationScripts.report-changes = ''
      PATH=$PATH:${
        lib.makeBinPath [
          pkgs.nvd
          pkgs.nix
        ]
      }
      nvd diff $(ls -dv /nix/var/nix/profiles/system-*-link | tail -2)
    '';
    system.autoUpgrade = disabled // enableOpt [ "allowReboot" ];

    programs.nix-ld = enabled // {
      package = pkgs.nix-ld-rs;

      libraries = with pkgs; [
        gcc
        icu
        libcxx
        stdenv.cc.cc.lib
        zlib
      ];
    };
    systemd.services.nix-daemon.environment = lib.${namespace}.proxy.go;
  };
  _args = { inherit value args; };
in
nixosModule _args
