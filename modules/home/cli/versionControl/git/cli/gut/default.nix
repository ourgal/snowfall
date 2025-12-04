args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      nixPkgs = "gut";
      files = {
        ".gut/consent.toml" = {
          Telemetry = false;
        };
        ".gut/profiles.toml" = {
          mZP-mvQBynsRxGy31Elwj = {
            Alias = "git";
            Website = "git.zxc.cn";
            Username = config.programs.git.settings.user.name;
            Email = config.programs.git.settings.user.email;
          };
        };
      };
    }
  )
)
