args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vim = {
        plugins = with pkgs.vimPlugins; [ ack-vim ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
