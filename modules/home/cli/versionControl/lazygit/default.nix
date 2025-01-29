args:
args.module (
  args
  // (
    let
      inherit (args) enabled;
    in
    {
      path = ./.;
      progs = {
        lazygit = {
          settings = {
            gui.nerdFontsVersion = "3";
            promptToReturnFromSubprocess = false;
            git.parseEmoji = true;
            customCommands = [
              {
                key = "a";
                command = "git remote set-url origin --push --add {{index .SelectedRemote.Urls 0}}";
                context = "remotes";
                loadingText = "Adding...";
                description = "add remote url to origin push";
              }
              {
                key = "A";
                command = "git remote set-url origin --push --delete {{index .SelectedRemote.Urls 0}}";
                context = "remotes";
                loadingText = "Deleting...";
                description = "delete remote url from origin push";
              }
              {
                key = "<c-P>";
                description = "Push to a specific remote repository";
                context = "global";
                loadingText = "Pushing ...";
                prompts = [
                  {
                    type = "menuFromCommand";
                    title = "Which remote repository to push to?";
                    command = ''bash -c "git remote --verbose | grep '/.* (push)'"'';
                    filter = "(?P<remote>.*)s+(?P<url>.*) (push)";
                    valueFormat = "{{ .remote }}";
                    labelFormat = "{{ .remote | bold | cyan }} {{ .url }}";
                  }
                  {
                    type = "menu";
                    title = "How to push?";
                    options = [
                      { value = "push"; }
                      { value = "push --force-with-lease"; }
                      { value = "push --force"; }
                    ];
                  }
                ];
              }
              {
                key = "b";
                command = "tig blame -- {{.SelectedFile.Name}}";
                context = "files";
                description = "blame file at tree";
                subprocess = true;
              }
              {
                key = "b";
                command = "tig blame {{.SelectedLocalCommit.Sha}} -- {{.SelectedCommitFile.Name}}";
                context = "commitFiles";
                description = "blame file at revision";
                subprocess = true;
              }
              {
                key = "B";
                command = "tig blame -- {{.SelectedCommitFile.Name}}";
                context = "commitFiles";
                description = "blame file at tree";
                subprocess = true;
              }
              {
                key = "t";
                command = "tig {{.SelectedLocalCommit.Sha}} -- {{.SelectedCommitFile.Name}}";
                context = "commitFiles";
                description = "tig file (history of commits affecting file)";
                subprocess = true;
              }
              {
                key = "t";
                command = "tig -- {{.SelectedFile.Name}}";
                context = "files";
                description = "tig file (history of commits affecting file)";
                subprocess = true;
              }
              {
                key = "<c-v>";
                command = "git commit --message '{{.Form.Type}}{{.Form.Scope}}{{.Form.Breaking}}: {{.Form.Message}}'";
                context = "global";
                description = "Create new conventional commit";
                loadingText = "Creating conventional commit...";
                prompts = [
                  {
                    type = "menu";
                    key = "Type";
                    title = "Type of change";
                    options = [
                      {
                        name = "build";
                        description = "Changes that affect the build system or external dependencies";
                        value = "build";
                      }
                      {
                        name = "feat";
                        description = "A new feature";
                        value = "feat";
                      }
                      {
                        name = "fix";
                        description = "A bug fix";
                        value = "fix";
                      }
                      {
                        name = "chore";
                        description = "Other changes that don't modify src or test files";
                        value = "chore";
                      }
                      {
                        name = "ci";
                        description = "Changes to CI configuration files and scripts";
                        value = "ci";
                      }
                      {
                        name = "docs";
                        description = "Documentation only changes";
                        value = "docs";
                      }
                      {
                        name = "perf";
                        description = "A code change that improves performance";
                        value = "perf";
                      }
                      {
                        name = "refactor";
                        description = "A code change that neither fixes a bug nor adds a feature";
                        value = "refactor";
                      }
                      {
                        name = "revert";
                        description = "Reverts a previous commit";
                        value = "revert";
                      }
                      {
                        name = "style";
                        description = "Changes that do not affect the meaning of the code";
                        value = "style";
                      }
                      {
                        name = "test";
                        description = "Adding missing tests or correcting existing tests";
                        value = "test";
                      }
                    ];
                  }
                  {
                    type = "input";
                    title = "Scope - Add '(<scope>)'";
                    key = "Scope";
                    initialValue = "";
                  }
                  {
                    type = "input";
                    title = "Breaking change - Add '!'";
                    key = "Breaking";
                    initialValue = "";
                  }
                  {
                    type = "input";
                    title = "message";
                    key = "Message";
                    initialValue = "";
                  }
                  {
                    type = "confirm";
                    key = "Confirm";
                    title = "Commit";
                    body = "Are you sure you want to commit?";
                  }
                ];
              }
            ];
          };
        };
      };
      enable = [
        "shortcut"
        "diff-so-fancy"
      ];
      value.catppuccin.lazygit = enabled;
    }
  )
)
