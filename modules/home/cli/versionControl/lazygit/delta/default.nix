args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      progs.lazygit.settings.git.paging = {
        colorArg = "always";
        pager = "${lib.getExe pkgs.delta} --paging=never";
      };
    }
  )
)
