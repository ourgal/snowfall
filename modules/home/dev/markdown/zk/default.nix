args:
args.module (
  args
  // (
    let
      inherit (args) config namespace pkgs;
    in
    {
      path = ./.;
      progs = {
        zk.settings = {
          note = {
            language = "en";
            default-title = "Untitled";
            filename = "{{id}}-{{slug title}}";
            extension = "md";
            template = "default.md";
            id-charset = "alphanum";
            id-length = 4;
            id-case = "lower";
          };
          extra = {
            author = config.${namespace}.user.name;
          };
          group = {
            journal = {
              paths = [
                "journal/weekly"
                "journal/daily"
              ];
              note = {
                filename = "{{format-date now}}";
              };
            };
          };
          format = {
            markdown = {
              hashtags = true;
              colon-tags = true;
            };
          };
          tool = {
            inherit (config.${namespace}.user) editor;
            shell = "${pkgs.bash}/bin/bash";
            pager = "less -FIRX";
            fzf-preview = "bat -p --color always {-1}";
          };
          filter = {
            recents = "--sort created- --created-after 'last two weeks'";
          };
          alias = {
            edlast = "zk edit --limit 1 --sort modified- $@";
            recent = "zk edit --sort created- --created-after 'last two weeks' --interactive";
            lucky = "zk list --quiet --format full --sort random --limit 1";
          };
          lsp = {
            diagnostics = {
              wiki-title = "hint";
              dead-link = "error";
            };
          };
        };
      };
    }
  )
)
