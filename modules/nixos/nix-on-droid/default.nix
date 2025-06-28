args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
    nix.settings.extra-platforms = [
      "aarch64-linux"
      "arm-linux"
    ];

    nix.settings = {
      extra-substituters = [ "https://nix-on-droid.cachix.org" ];
      extra-trusted-public-keys = [
        "nix-on-droid.cachix.org-1:56snoMJTXmDRC1Ei24CmKoUqvHJ9XCp+nidK7qkMQrU="
      ];
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
