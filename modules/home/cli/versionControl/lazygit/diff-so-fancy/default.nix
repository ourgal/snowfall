args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      progs.lazygit.settings.git.papers = [
        {
          colorArg = "always";
          pager = lib.getExe pkgs.diff-so-fancy;
        }
      ];
    }
  )
)
