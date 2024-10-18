args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    environment.variables = {
      # VAAPI and VDPAU config for accelerated video.
      # See https://wiki.archlinux.org/index.php/Hardware_video_acceleration
      "VDPAU_DRIVER" = "radeonsi";
      "LIBVA_DRIVER_NAME" = "radeonsi";
    };

    # for Vega
    hardware = {
      enableRedistributableFirmware = true;
      enableAllFirmware = true;
    };

    boot.initrd.kernelModules = [ "amdgpu" ];
    services.xserver.videoDrivers = [ "amdgpu" ];
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
