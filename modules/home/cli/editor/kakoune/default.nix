{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      kakoune = {
        config = {
          autoComplete = [
            "insert"
            "prompt"
          ];
          autoInfo = [
            "command"
            "onkey"
          ];
          colorScheme = "tomorrow-night";
          autoReload = "yes";
          wrapLines = {
            enable = true;
            marker = "⏎";
            word = true;
          };
          numberLines = {
            enable = true;
            highlightCursor = true;
            relative = true;
          };
          ui = {
            enableMouse = true;
            assistant = "none";
          };
        };
      };
    };
  }
)
