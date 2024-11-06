args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      progs.nixvim = {
        plugins.floaterm = {
          enable = true;
          opener = "edit";
          width = 0.99;
          height = 0.999;
          shell = "$SHELL";
          package = pkgs.${namespace}.vim-floaterm;
        };
        keymaps = [
          {
            key = "<leader>e";
            action = "<cmd>FloatermNew lf<cr>";
          }
          {
            key = "<leader>ff";
            action = "<cmd>FloatermNew broot<cr>";
          }
          {
            key = "<C-g>";
            action = "<cmd>FloatermNew lazygit<cr>";
          }
        ];
      };
    }
  )
)
