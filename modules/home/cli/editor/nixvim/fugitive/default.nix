{
  path = ./.;
  progs.nixvim = {
    plugins.fugitive = {
      enable = true;
    };
    keymaps = [
      {
        key = "<leader>gg";
        action = "<cmd>tab G<cr>";
      }
    ];
    extraFiles = {
      "ftplugin/fugitive.lua".source = ./fugitive.lua;
    };
  };
}
