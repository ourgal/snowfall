args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.nixvim = {
        extraPlugins = [
          pkgs.vimPlugins.vim-dirvish
          pkgs.${namespace}.vim-dirvish-dovish
        ];
        extraConfigLua = builtins.readFile ./config.lua;
        extraFiles = {
          "ftplugin/dirvish.lua".source = ./dirvish.lua;
        };
      };
    }
  )
)
