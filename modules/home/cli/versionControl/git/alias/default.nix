args:
args.module (
  args
  // (
    let
      inherit (args) namespace config;
    in
    {
      value = {
        ${namespace}.cli.utils.alias.aliae.alias = {
          ga = "git add";
          gd = "git diff";
          gs =
            if config.${namespace}.cli.versionControl.git.cli.scmpuff.enable then
              "scmpuff_status"
            else
              "git status";
          gl = ''git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'';
        };
      };
    }
  )
)
