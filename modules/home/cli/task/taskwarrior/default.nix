args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
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
      value = {
        ${namespace}.cli.utils.alias.aliae.alias = {
          taskw = "taskwarrior-tui";
        };
      };
    }
  )
)
