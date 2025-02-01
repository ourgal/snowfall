args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule;
  value = {
    boot.kernelModules = [ "acpi_call" ];
    boot.extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
