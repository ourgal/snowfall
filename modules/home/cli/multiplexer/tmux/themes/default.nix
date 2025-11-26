args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      enable = if config.catppuccin.enable then "catppuccin" else "minimal";
    }
  )
)
