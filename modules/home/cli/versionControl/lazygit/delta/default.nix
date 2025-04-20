args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.lazygit.settings.git.paging = {
        colorArg = "always";
        pager = "${pkgs.delta}/bin/delta --paging=never";
      };
    }
  )
)
