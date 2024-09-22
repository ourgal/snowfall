{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "advance-touch";
    nixPkgs = [
      # keep-sorted start
      "acpi"
      "compsize"
      "coreutils-full"
      "cpu-x"
      "cyme"
      "dmidecode"
      "file"
      "glxinfo"
      "libva-utils"
      "pciutils"
      "progress"
      "usbutils"
      "vulkan-tools"
      "wev"
      # keep-sorted end
    ];
    xorgPkgs = "xev";
    enable = "brotab";
  }
)
