args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        namespace
        lib
        host
        ;
      inherit (builtins) elem;
      inherit (lib.${namespace}) settings;
      user = config.${namespace}.user.name;
    in
    {
      nixPkgs = "git-ftp";
      progs.git.extraConfig.git-ftp = lib.mkIf (elem host settings.desktops && !elem host settings.work) {
        url = "brix.local";
        inherit user;
        password = lib.strings.fileContents ./password.key;
      };
    }
  )
)
