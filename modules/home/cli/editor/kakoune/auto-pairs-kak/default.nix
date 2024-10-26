args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      progs.kakoune = {
        extraConfig = ''
          set-option global auto_pairs ( ) { } [ ] '"' '"' "'" "'" ` ` “ ” ‘ ’ « » ‹ ›
          enable-auto-pairs
        '';
        plugins = [ pkgs.kakounePlugins.auto-pairs-kak ];
      };
    }
  )
)
