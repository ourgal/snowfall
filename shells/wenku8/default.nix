{ pkgs, mkShell, ... }:

mkShell {
  packages = [
    pkgs.playwright-driver.browsers
    pkgs.python3Packages.requests
    pkgs.python3Packages.pandas
    pkgs.python3Packages.beautifulsoup4
    pkgs.python3Packages.playwright
  ];
  shellHook = ''
    export PLAYWRIGHT_BROWSERS_PATH=${pkgs.playwright-driver.browsers}
    export PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS=true
  '';

}
