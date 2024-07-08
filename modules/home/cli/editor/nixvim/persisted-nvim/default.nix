{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = with args; {
      nixvim = {
        extraPlugins = with pkgs.vimPlugins; [ persisted-nvim ];
      };
    };
  }
)
