args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.kakoune = {
        config.keyMappings = [
          {
            mode = "user";
            key = "f";
            effect = ":fzf-mode<ret>";
          }
        ];
        plugins = [ pkgs.kakounePlugins.fzf-kak ];
      };
    }
  )
)
