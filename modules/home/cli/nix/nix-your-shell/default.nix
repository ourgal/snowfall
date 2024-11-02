args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = "nix-your-shell";
      progs.fish.interactiveShellInit = ''
        ${pkgs.nix-your-shell}/bin/nix-your-shell fish | source
      '';
    }
  )
)
