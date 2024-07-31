{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = with args; {
      gh = {
        extensions = with pkgs; [
          gh-dash
          gh-eco
          gh-f
          gh-s
          pkgs.${namespace}.gh-branch
          pkgs.${namespace}.gh-cp
          pkgs.${namespace}.gh-screensaver
          pkgs.${namespace}.gh-stars
        ];
      };
    };
  }
)
