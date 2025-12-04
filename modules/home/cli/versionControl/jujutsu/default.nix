args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      myPkgs = "jj-fzf";
      nixPkgs = "jjui";
      progs = {
        jujutsu.settings = {
          user = {
            name = config.programs.git.settings.user.name;
            email = config.programs.git.settings.user.email;
          };
          ui = {
            default-command = "log";
            paginate = "never";
          };
          template-aliases = {
            "format_short_signature(signature)" = "signature.name()";
          };
        };
        fish.shellAbbrs.jjp = "jj ci && jj branch set main -r @- && jj git push --all";
      };
    }
  )
)
