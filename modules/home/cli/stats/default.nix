{
  enable = [
    # keep-sorted start
    "btop"
    "gotop"
    "htop"
    "top"
    # keep-sorted end
  ];
  nvtopPkgs = "full";
  nixPkgs = [
    # keep-sorted start
    "acpi"
    "atop"
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
