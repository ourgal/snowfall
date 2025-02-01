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
    domains
    ;
  value = {
    nix =
      let
        mirrors = [
          "http://${domains.harmonia}"
          "https://mirrors.cernet.edu.cn/nix-channels/store"
          "https://cache.nixos.org"
          "https://nix-community.cachix.org"
        ];
      in
      {
        settings = enableOpt [ "auto-optimise-store" ] // {
          experimental-features = [
            "nix-command"
            "flakes"
            "pipe-operators"
          ];
          substituters = lib.mkBefore mirrors;
          trusted-substituters = lib.mkBefore mirrors;
          trusted-public-keys = [
            "cache.example.org-1:lFI4YUR1ZKE8dz1JoXTRBvIEHaeKmW3LHBlDTJDW1V8="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          ];
          trusted-users = [
            "root"
            config.${namespace}.user.name
          ];
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
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
