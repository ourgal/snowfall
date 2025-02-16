args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "tasksh"
        "taskwarrior-tui"
        "timewarrior"
        "vit"
        # keep-sorted end
      ];
      progs.taskwarrior.package = pkgs.taskwarrior3;
      enable = [ "timewarrior" ];
    }
  )
)
