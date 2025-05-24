args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.nixvim = {
        plugins.floaterm = {
          enable = true;
          settings = {
            width = 0.99;
            shell = "$SHELL";
            opener = "edit";
            height = 0.999;
          };
          package = pkgs.${namespace}.vim-floaterm;
        };
        keymaps = [
          {
            key = "<leader>e";
            action = "<cmd>FloatermNew lf<cr>";
          }
          {
            key = "<leader><space>";
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
