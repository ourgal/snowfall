args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.lazygit.settings.git.paging.externalDiffCommand =
        "${pkgs.difftastic}/bin/difft --color=always --syntax-highlight=off";
    }
  )
)
