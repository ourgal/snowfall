args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "powershell"
      # keep-sorted end
    ];
    confs.powershell = ./Microsoft.PowerShell_profile.ps1;
  }
)
