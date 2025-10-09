args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    disabled
    enableOpt
    disableOpt
    ;
  inherit (config.${namespace}.user) host;
  value = {
    services.xserver =
      {
        videoDrivers = [ "nvidia" ];
      }
      // lib.optionalAttrs (host == "home") {
        screenSection = ''Option "metamodes" "nvidia-auto-select {ForceFullCompositionPipeline=On}, nvidia-auto-select {ForceFullCompositionPipeline=On}"'';
      };

    environment.variables = {
      LIBVA_DRIVER_NAME = "nvidia";
    };

    hardware.nvidia =
      {
        modesetting = enabled;
        powerManagement = disabled // disableOpt [ "finegrained" ];
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      }
      // enableOpt [ "nvidiaSettings" ]
      // disableOpt [ "open" ]
      // lib.optionalAttrs (host != "home") { forceFullCompositionPipeline = true; };

  };
  _args = { inherit value args; };
in
nixosModule _args
