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
    "below"
    "compsize"
    "cyme"
    "dmidecode"
    "fastfetch"
    "file"
    "hyfetch"
    "libva-utils"
    "mesa-demos"
    "onefetch"
    "pciutils"
    "usbutils"
    "vulkan-tools"
    "wev"
    "xev"
    "zenith"
    # keep-sorted end
  ];
  nixX86Pkgs = [
    "glances"
    "cpu-x"
    "owofetch"
  ];
}
