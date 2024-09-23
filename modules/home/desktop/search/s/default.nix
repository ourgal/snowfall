{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) config namespace pkgs;
      inherit (config.${namespace}.user) browser;
    in
    {
      path = ./.;
      myPkgs = "s";
      progs = {
        fish.functions.sp = {
          body = ''
            s -b ${browser} -p $argv[1] $argv[2..-1]
            ${pkgs.wmctrl}/bin/wmctrl -a ${browser}
          '';
          description = "alias of s -p";
        };
      };
    }
  )
)
