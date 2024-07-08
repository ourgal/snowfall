{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        plugins = {
          floaterm.enable = true;
        };
        keymaps = [
          {
            key = "<leader>e";
            action = "<cmd>FloatermNew lf<cr>";
          }
          # {
          #   key = "<leader>f";
          #   action = "<cmd>FloatermNew broot<cr>";
          # }
          {
            key = "<C-g>";
            action = "<cmd>FloatermNew lazygit<cr>";
          }
        ];
        extraConfigLua = builtins.readFile ./config.lua;
      };
    };
  }
)
