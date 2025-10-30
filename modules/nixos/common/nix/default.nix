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
    ip
    ;
  inherit (config.${namespace}.user) host;
  value = {
    nix =
      let
        mirrors = [
          "https://mirrors.cernet.edu.cn/nix-channels/store?priority=10"
          "https://cache.nixos.org"
          "https://nix-community.cachix.org?priority=100"
        ]
        ++ lib.optionals (host == "home") [
          "http://${ip.brix}:50000?priority=9"
          "http://${ip.router}:50000?priority=9"
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

    nixpkgs.config.allowUnfree = true;
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
