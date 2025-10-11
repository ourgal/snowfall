args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      progs.lazygit.settings = {
        gui.sidePanelWidth = 0.2;
        git.paging = {
          colorArg = "never";
          pager = "${lib.getExe pkgs.ydiff} -p cat -s --wrap --width={{columnWidth}}";
        };
      };
    }
  )
)
