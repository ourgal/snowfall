args:
args.module (
  args
  // (
    let
      inherit (args) namespace enabled;
    in
    {
      value.${namespace}.cli = {
        utils.cd.broot = enabled;
        file-manager.lf = enabled;
        versionControl.lazygit = enabled;
      };
      progs.vim = {
        plugins = "vim-floaterm";
        extraConfig = ./config.vim;
      };
    }
  )
)
