{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = with args; {
      yazi = {
        enableFishIntegration = true;
        keymap = {
          input = {
            prepend_keymap = [
              {
                on = [ "<Esc>" ];
                run = "close";
                desc = "Cancel input";
              }
            ];
          };
          manager = {
            prepend_keymap = [
              {
                on = [ "l" ];
                run = "plugin --sync smart-enter";
                desc = "Enter the child directory, or open the file";
              }
              {
                on = [
                  "g"
                  "."
                ];
                run = "cd ${config.xdg.configHome}";
                desc = "Enter the config directory";
              }
              {
                on = [
                  "g"
                  "c"
                ];
                run = "noop";
              }
            ];
          };
        };
      };
    };
  }
)
