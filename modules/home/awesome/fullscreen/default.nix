args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        namespace
        host
        pkgs
        sources
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
        if config.${namespace}.desktop.system.dcnnt.enable then # lua
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
            inherit (sources.lain.src)
              owner
              repo
              rev
              sha256
              ;
          };
          "awesome/freedesktop".source = pkgs.fetchFromGitHub {
            inherit (sources.awesome-freedesktop.src)
              owner
              repo
              rev
              sha256
              ;
          };
        };
      };
    }
  )
)
