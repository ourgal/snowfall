{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      progs = {
        lazygit.settings.git.paging = {
          colorArg = "always";
          pager = "${pkgs.diff-so-fancy}/bin/diff-so-fancy";
        };
      };
    }
  )
)
