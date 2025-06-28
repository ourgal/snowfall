{ pkgs, ... }:
{
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = # fish
        ''
          set fish_greeting
          scheme set tokyonight
          set -Ux fish_key_bindings fish_vi_key_bindings
        '';
      plugins = [
        rec {
          name = "fish-color-scheme-switcher";
          inherit (pkgs.sources."${name}") src;
        }
        rec {
          name = "autopair.fish";
          inherit (pkgs.sources."${name}") src;
        }
        rec {
          name = "clownfish";
          inherit (pkgs.fishPlugins."${name}") src;
        }
        rec {
          name = "ctrl-z.fish";
          inherit (pkgs.sources."${name}") src;
        }
        rec {
          name = "done";
          inherit (pkgs.fishPlugins."${name}") src;
        }
        rec {
          name = "fc-fish";
          inherit (pkgs.sources."${name}") src;
        }
        rec {
          name = "fish-abbreviation-tips";
          inherit (pkgs.sources."${name}") src;
        }
      ];
    };
  };
}
