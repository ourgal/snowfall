args:
args.module (
  args
  // (
    let
      inherit (args) config namespace lib;
      user = config.${namespace}.user.name;
    in
    {
      nixPkgs = "git-ftp";
      progs.git.extraConfig.git-ftp = {
        url = "brix.local";
        inherit user;
        password = lib.strings.fileContents ./password.key;
      };
    }
  )
)
