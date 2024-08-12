{ ... }@args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace}) nixosModule mkDockerProxy enabled;
  docker = config.${namespace}.docker;
  host = "brix.local";
  token = lib.strings.fileContents ./token.key;
  domain = lib.strings.fileContents ./domain.key;
  value = {
    services.caddy =
      enabled
      // {
        virtualHosts = (mkDockerProxy { inherit docker host; }) // {
          "alist.${domain}.duckdns.org".extraConfig = ''
            tls {
                dns duckdns ${token}
            }
            reverse_proxy brix.local:5244
          '';
        };
      }
      // {
        package = (
          pkgs.callPackage
            "${builtins.fetchurl {
              url = "https://raw.githubusercontent.com/jpds/nixpkgs/a33b02fa9d664f31dadc8a874eb1a5dbaa9f4ecf/pkgs/servers/caddy/default.nix";
              sha256 = "1x1g6qyhmclz2jyc5nmfjsri3xx4pw5rd15n2xjkxlgdcvywcv5f";
            }}"
            {
              externalPlugins = [
                {
                  name = "duckdns";
                  repo = "github.com/caddy-dns/duckdns";
                  version = "v0.4.0";
                }
              ];
              vendorHash = "sha256-UBn/jQIoi9yq3ZLd+LvDM7PUE0kqP0GKTU+oQIdHztw="; # Add this, as explained in https://github.com/NixOS/nixpkgs/pull/259275#issuecomment-1763478985
            }
        );
      };
    networking.firewall.allowedTCPPorts = [
      80
      443
    ];
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
