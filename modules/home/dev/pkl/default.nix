args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      value = {
        home.file = {
          ".local/bin/pkl" = {
            source = pkgs.fetchurl {
              url = "https://repo1.maven.org/maven2/org/pkl-lang/pkl-cli-java/0.25.3/pkl-cli-java-0.25.3.jar";
              hash = "sha256-dYnD18JTHQRG29ySmQoT/5aANjMGDAR1TJYZjiNP5kQ=";
            };
            executable = true;
          };
        };
      };
    }
  )
)
