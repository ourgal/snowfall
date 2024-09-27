{
  writeShellApplication,
  lib,
  git,
  fetchurl,
}:
writeShellApplication rec {
  name = "better-git-branch";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ git ];

  text = builtins.readFile (fetchurl {
    url = "https://gist.githubusercontent.com/schacon/e9e743dee2e92db9a464619b99e94eff/raw/2e3ae498c2177f5974679a6ab33849cbf33b209e/better-git-branch.sh";
    hash = "sha256-KkKWV+OB1uve0csofMvPz7mK39miYt2JllN+Kpipk4g=";
  });
}
