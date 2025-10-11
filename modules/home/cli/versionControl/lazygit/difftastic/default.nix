args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      progs.lazygit.settings.git.paging.externalDiffCommand =
        "${lib.getExe pkgs.difftastic} --color=always --syntax-highlight=off";
    }
  )
)
