args:
args.module (
  args
  // (
    let
      inherit (args) lib config;
    in
    {
      progs.zathura = {
        options =
          {
            "selection-clipboard" = "clipboard";
            "adjust-open" = "width";
            "scroll-page-aware" = true;
            "smooth-scroll" = true;
            "scroll-full-overlap" = "0.01";
            "scroll-step" = "100";
            "font" = "Source Han Sans SC 14";
          }
          // lib.mkIf (!config.catppuccin.enable) {
            "default-bg" = "#000000"; # 00
            "default-fg" = "#F7F7F6"; # 01
            "statusbar-fg" = "#B0B0B0"; # 04
            "statusbar-bg" = "#202020"; # 01
            "inputbar-bg" = "#151515"; # 00 currently not used
            "inputbar-fg" = "#FFFFFF"; # 02
            "notification-error-bg" = "#AC4142"; # 08
            "notification-error-fg" = "#151515"; # 00
            "notification-warning-bg" = "#AC4142"; # 08
            "notification-warning-fg" = "#151515"; # 00
            "highlight-color" = "#F4BF75"; # 0A
            "highlight-active-color" = "#6A9FB5"; # 0D
            "completion-highlight-fg" = "#151515"; # 02
            "completion-highlight-bg" = "#90A959"; # 0C
            "completion-bg" = "#303030"; # 02
            "completion-fg" = "#E0E0E0"; # 0C
            "notification-bg" = "#90A959"; # 0B
            "notification-fg" = "#151515"; # 00
            "recolor" = true;
            "recolor-lightcolor" = "#000000"; # 00
            "recolor-darkcolor" = "#E0E0E0"; # 06
            "recolor-reverse-video" = true;
            "recolor-keephue" = true;
          };
      };
    }
  )
)
