args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.vim = {
        plugins = with pkgs.${namespace}; [ parinfer-rust ];
        extraConfig = builtins.readFile ./config.vim;
      };
    }
  )
)
