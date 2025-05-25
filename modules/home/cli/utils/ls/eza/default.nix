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
      nixPkgs = "eza";
      value = {
        ${namespace}.cli.utils.alias.aliae.alias = {
          ll = "eza -l ${extOpts}";
          lt = "eza --tree ${extOpts}";
        };
      };
    }
  )
)
