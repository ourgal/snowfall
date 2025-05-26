{
  myPkgs = "powershell-beautifier";
  nixPkgs = [
    # keep-sorted start
    "powershell"
    "powershell-editor-services"
    # keep-sorted end
  ];
  confs.powershell = ./Microsoft.PowerShell_profile.ps1;
}
