{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) toTOML config;
    in
    {
      path = ./.;
      nixPkgs = "gut";
      files = {
        ".gut/consent.toml" = toTOML { Telemetry = false; };
        ".gut/profiles.toml" = toTOML {
          mZP-mvQBynsRxGy31Elwj = {
            Alias = "git";
            Website = "git.zxc.cn";
            Username = config.programs.git.userName;
            Email = config.programs.git.userEmail;
          };
        };
      };
    }
  )
)
