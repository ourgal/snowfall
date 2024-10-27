{
  inputs,
  mkShell,
  pkgs,
  system,
  ...
}:
let
  inherit (inputs) snowfall-flake;
in
mkShell {
  packages = with pkgs; [
    gnumake
    git
    snowfall-flake.packages.${system}.flake
  ];

  shellHook = '''';
}
