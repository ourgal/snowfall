args:
args.module (
  args
  // (
    let
      inherit (args) namespace;
      extOpts = builtins.concatStringsSep " " [
        "--git"
        "--icons"
        "auto"
        "--group"
        "--group-directories-first"
        "--time-style"
        "relative"
      ];
    in
    {
      path = ./.;
      nixPkgs = "eza";
      value = {
        ${namespace}.cli.utils.alias.aliae.alias = {
          ls = "eza ${extOpts}";
          la = "eza -a ${extOpts}";
          ll = "eza -l ${extOpts}";
          lla = "eza -al ${extOpts}";
          lt = "eza --tree ${extOpts}";
        };
      };
    }
  )
)
