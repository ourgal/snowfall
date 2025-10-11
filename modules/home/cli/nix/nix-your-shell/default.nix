args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      nixPkgs = "nix-your-shell";
      progs.fish.interactiveShellInit = ''
        ${lib.getExe pkgs.nix-your-shell} fish | source
      '';
    }
  )
)
