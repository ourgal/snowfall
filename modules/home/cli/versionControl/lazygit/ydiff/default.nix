args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.lazygit.settings = {
        gui.sidePanelWidth = 0.2;
        git.paging = {
          colorArg = "never";
          pager = "${pkgs.ydiff}/bin/ydiff -p cat -s --wrap --width={{columnWidth}}";
        };
      };
    }
  )
)
