{
  path = ./.;
  myPkgs = "powershell-beautifier";
  nixPkgs = [
    # keep-sorted start
    "powershell"
    # keep-sorted end
  ];
  confs.powershell = ./Microsoft.PowerShell_profile.ps1;
}
