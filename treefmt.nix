{ ... }:
{
  projectRootFile = "treefmt.nix";
  programs.nixfmt = {
    enable = true;
    strict = true;
  };
  programs.deadnix.enable = true;
  settings.formatter.nixfmt.excludes = [ "_sources/generated.nix" ];
}
