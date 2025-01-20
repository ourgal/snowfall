{
  lib,
  stdenv,
  powershell,
  writeShellScriptBin,
  _sources,
}:
let
  powershell-beautifier = stdenv.mkDerivation rec {
    inherit (_sources.powershell-beautifier) pname version src;

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/powershell/Modules/PowerShell-Beautifier
      cp -r ./* $out/share/powershell/Modules/PowerShell-Beautifier
      substituteInPlace $out/share/powershell/Modules/PowerShell-Beautifier/src/DTW.PS.Beautifier.PopulateValidNames.psm1 \
        --replace-fail 'Join-Path -Path $PSScriptRoot -ChildPath "DTW.PS.BeautifierValidValuesCache.txt"' 'Join-Path -Path $HOME -ChildPath ".cache/DTW.PS.BeautifierValidValuesCache.txt"'
    '';

    meta = {
      description = "A whitespace reformatter and code cleaner for Windows PowerShell and PowerShell Core";
      homepage = "https://github.com/DTW-DanWard/PowerShell-Beautifier";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "power-shell-beautifier";
      platforms = lib.platforms.all;
    };
  };
in
writeShellScriptBin "powershell-beautifier" ''
  ${powershell}/bin/pwsh -NoProfile -NoLogo \
  -Command "Import-Module ${powershell-beautifier}/share/powershell/Modules/PowerShell-Beautifier/PowerShell-Beautifier.psd1; Edit-DTWBeautifyScript -SourcePath \"$@\""
''
