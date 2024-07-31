{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "advance-touch";
    nixPkgs = [
      "acpi"
      "compsize"
      "coreutils-full"
      "cpu-x"
      "cyme"
      "dmidecode"
      "du-dust"
      "dua"
      "duc"
      "duf"
      "fd"
      "file"
      "gdu"
      "glxinfo"
      "libva-utils"
      "mmv-go"
      "pciutils"
      "procs"
      "progress"
      "ripgrep"
      "rm-improved"
      "trash-cli"
      "ugrep"
      "usbutils"
      "vulkan-tools"
      "wev"
      "xcp"
    ];
    xorgPkgs = "xev";
    enable = "eza";
  }
)
