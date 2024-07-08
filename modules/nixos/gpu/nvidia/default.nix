{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    disabled
    enable
    disable
    ;
  value = {
    services.xserver.videoDrivers = [ "nvidia" ];

    environment.variables = {
      LIBVA_DRIVER_NAME = "nvidia";
    };

    hardware.nvidia = {
      modesetting = enabled;
      powerManagement = disabled // disable [ "finegrained" ];
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    } // enable [ "nvidiaSettings" ] // disable [ "open" ];
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
