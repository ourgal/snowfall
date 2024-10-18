args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        plugins = {
          auto-save = {
            enable = true;
            extraOptions = {
              execution_message = {
                enabled = false;
              };
            };
          };
        };
      };
    };
  }
)
