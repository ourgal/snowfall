args:
args.module (
  args
  // ({
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
      "glances"
      "mesa-demos"
      "libva-utils"
      "neofetch"
      "onefetch"
      "pciutils"
      "usbutils"
      "vulkan-tools"
      "wev"
      "zenith"
      # keep-sorted end
    ];
    nixX86Pkgs = [
      "cpu-x"
      "owofetch"
    ];
    xorgPkgs = "xev";
  })
)
