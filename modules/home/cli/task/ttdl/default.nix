{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) inputs;
    in
    {
      path = ./.;
      nixPkgs = "ttdl";
      confs = {
        "ttdl/ttdl.toml" = inputs.nix-std.lib.serde.toTOML {
          colors = {
            color_term = "ansi";
            overdue = "bright red";
            threshold = "red";
            top = "bright red";
            important = "white";
            done = "bright black";
            today = "bright yellow";
            soon = "white";
            old = "bright black";
          };
          ranges = {
            soon = 0;
            important = "";
            old = "1y";
          };
          global = {
            filename = "~/.config/todo/todo.txt";
            creation_date_auto = true;
          };
          syntax = {
            tag_color = "bright cyan";
            hashtag_color = "cyan";
            project_color = "bright green";
            context_color = "green";
          };
        };
      };
    }
  )
)
