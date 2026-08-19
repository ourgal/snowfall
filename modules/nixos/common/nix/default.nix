args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    inputs
    ;
  inherit (lib.${namespace})
    nixosModule
    enableOpt
    disabled
    enabled
    ;
  inherit (config.${namespace}.user) host;
  isHarmonia = true && (host == "nuc");
  value = {
    nix =
      let
        mirrors = [
          "https://mirror.nju.edu.cn/nix-channels/store?priority=10"
          "https://mirror.sjtu.edu.cn/nix-channels/store?priority=11"
          "https://nix-community.cachix.org?priority=100"
        ]
        ++ lib.optional isHarmonia "http://192.168.123.100:50000?priority=9";
      in
      {
        settings = enableOpt [ "auto-optimise-store" ] // {
          experimental-features = [
            "nix-command"
            "flakes"
            "pipe-operators"
          ];
          extra-substituters = lib.mkBefore mirrors;
          extra-trusted-public-keys = [
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          ]
          ++ lib.optional isHarmonia "cache.example.org-1:lFI4YUR1ZKE8dz1JoXTRBvIEHaeKmW3LHBlDTJDW1V8=";
          trusted-users = [ config.${namespace}.user.name ];
          fallback = true;
          max-jobs =
            if
              builtins.elem host [
                "t4"
                "n1"
              ]
            then
              1
            else
              "auto";
        };
        gc =
          lib.mkIf (!config.${namespace}.nh.enable) {
            dates = "weekly";
            options = "--delete-older-than 7d";
          }
          // enableOpt [ "automatic" ];
        nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      };

    system.activationScripts.system-diff = {
      supportsDryActivation = true; # safe: only outputs to stdout
      text = ''
        if [ -e /run/current-system ]; then
          PATH=$PATH:${pkgs.nix}/bin ${lib.getExe pkgs.nvd} diff /run/current-system $systemConfig
        fi
      '';
    };
    system.autoUpgrade = disabled // enableOpt [ "allowReboot" ];

    programs.nix-ld = enabled // {
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
