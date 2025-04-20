args:
args.module (
  args
  // (
    let
      inherit (args) host config;
    in
    {
      value = {
        sops = {
          secrets =
            if (host == "surface") then
              {
                "ssh/surface/private" = {
                  mode = "0600";
                  path = "${config.home.homeDirectory}/.ssh/id_ed25519";
                };
                "ssh/surface/public" = {
                  mode = "0644";
                  path = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
                };
              }
            else
              {
                "ssh/home/private" = {
                  mode = "0600";
                  path = "${config.home.homeDirectory}/.ssh/id_ed25519";
                };
                "ssh/home/public" = {
                  mode = "0644";
                  path = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
                };
              };
        };
      };
    }
  )
)
