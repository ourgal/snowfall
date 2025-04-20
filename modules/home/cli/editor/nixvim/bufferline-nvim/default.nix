{
  progs.nixvim = {
    plugins.bufferline.enable = true;
    keymaps = [
      # Bufferline bindings
      # {
      #   mode = "n";
      #   key = "<Tab>";
      #   action = "<cmd>BufferLineCycleNext<cr>";
      #   options = {
      #     desc = "Cycle to next buffer";
      #   };
      # }

      # {
      #   mode = "n";
      #   key = "<S-Tab>";
      #   action = "<cmd>BufferLineCyclePrev<cr>";
      #   options = {
      #     desc = "Cycle to previous buffer";
      #   };
      # }

      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = {
          desc = "Cycle to next buffer";
        };
      }

      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options = {
          desc = "Cycle to previous buffer";
        };
      }

      {
        mode = "n";
        key = "X";
        action = "<cmd>bdelete<cr>";
        options = {
          desc = "Delete buffer";
        };
      }
    ];
  };
}
