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
    mkOpt'
    cfgNixos
    ;
  cfg = cfgNixos config.${namespace} ./.;
  mirror =
    if cfg.mirror == "nju" then
      "https://mirror.nju.edu.cn/nix-channels/store"
    else
      "https://mirrors.cernet.edu.cn/nix-channels/store";
  value = {
    nix =
      let
        mirrors = [
          "${mirror}?priority=100"
          "https://cache.nixos.org?priority=99"
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
  extraOpts = {
    mirror = mkOpt' (lib.types.enum [
      "cernet"
      "nju"
    ]) "nju";
  };
  path = ./.;
  _args = {
    inherit
      value
      path
      args
      extraOpts
      ;
  };
in
nixosModule _args
