args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "btop"
      "htop"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "acpi"
      "compsize"
      "cpu-x"
      "cyme"
      "dmidecode"
      "fastfetch"
      "file"
      "glances"
      "glxinfo"
      "libva-utils"
      "neofetch"
      "nvtop"
      "onefetch"
      "owofetch"
      "pciutils"
      "usbutils"
      "vulkan-tools"
      "wev"
      "zenith"
      # keep-sorted end
    ];
    xorgPkgs = "xev";
  }
)
