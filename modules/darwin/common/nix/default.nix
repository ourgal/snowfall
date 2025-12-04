args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    inputs
    ;
  inherit (lib.${namespace}) darwinModule enableOpt;
  inherit (config.${namespace}.user) host;
  value = {
    nix =
      let
        mirrors = [
          "https://cache.nixos.org"
          "https://nix-community.cachix.org?priority=100"
        ];
      in
      {
        optimise.automatic = true;
        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
            "pipe-operators"
          ];
          substituters = lib.mkBefore mirrors;
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
        gc = {
          interval = [
            {
              Hour = 3;
              Minute = 15;
              Weekday = 7;
            }
          ];
          options = "--delete-older-than 7d";
        }
        // enableOpt [ "automatic" ];
        nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
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
  };
  _args = { inherit value args; };
in
darwinModule _args
