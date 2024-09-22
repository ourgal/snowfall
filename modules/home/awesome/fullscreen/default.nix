{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        namespace
        host
        pkgs
        ;
      baseConfig = builtins.readFile ./rc.lua;
      hostConfig =
        if (host == "home") then # lua
          ''
            awful.spawn(terminal, { screen = 1, tag = "1" })
            awful.spawn("firefox", { screen = 1, tag = "2" })
            awful.spawn(terminal, { screen = 2, tag = "1" })
            awful.spawn("brave", { screen = 2, tag = "2" })
            awful.spawn("crow")
          ''
        # lua
        else
          ''
            awful.spawn(terminal)
          '';
      dcnntConfig =
        if (config.${namespace}.desktop.system.dcnnt.enable) then # lua
          ''
            awful.spawn("dcnnt start")
          ''
        else
          "";
      finalConfig = baseConfig + hostConfig + dcnntConfig;
    in
    {
      path = ./.;
      value = {
        xdg.configFile = {
          "awesome/rc.lua".text = finalConfig;
          "awesome/theme.lua".source = ./theme.lua;
          "awesome/background.jpg".source = ./background.jpg;
          "awesome/themes".source = ./themes;
          "awesome/lain".source = pkgs.fetchFromGitHub {
            owner = "lcpz";
            repo = "lain";
            rev = "88f5a8abd2649b348ffec433a24a263b37f122c0";
            hash = "sha256-MH/aiYfcO3lrcuNbnIu4QHqPq25LwzTprOhEJUJBJ7I=";
          };
          "awesome/freedesktop".source = pkgs.fetchFromGitHub {
            owner = "lcpz";
            repo = "awesome-freedesktop";
            rev = "c82ad2960c5f0c84e765df68554c266ea7e9464d";
            hash = "sha256-lQstCcTPUYUt5hzAJIyQ16crPngeOnUla7I4QiG6gEs=";
          };
        };
      };
    }
  )
)
