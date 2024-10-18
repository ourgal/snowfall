args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        keymaps = [
          {
            key = "ZZ";
            action = "<cmd>xa<cr>";
          }
          {
            key = "ZQ";
            action = "<cmd>qa<cr>";
          }
          {
            key = "<C-h>";
            action = "<C-w>h";
          }
          {
            key = "<C-j>";
            action = "<C-w>j";
          }
          {
            key = "<C-l>";
            action = "<C-w>l";
          }
          {
            key = "<C-k>";
            action = "<C-w>k";
          }
        ];
      };
    };
  }
)
