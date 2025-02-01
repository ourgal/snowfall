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
  value = {
    services.xserver.videoDrivers = [ "nvidia" ];

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
      // disableOpt [ "open" ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
