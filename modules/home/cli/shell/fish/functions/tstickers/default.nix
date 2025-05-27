args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      progs.fish.functions.tstickers = {
        description = "download telegram stickers";
        wraps = "tstickers";
        body = ''
          command tstickers --token (cat ${config.xdg.configHome}/telegram/bot1) --pack $argv
        '';
      };
    }
  )
)
