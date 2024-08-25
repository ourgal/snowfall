{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "gnumake"
      "pipx"
      "podman"
      "podman-compose"
      # keep-sorted end
    ];
    files = {
      ".ssh./.keep" = "";
    };
    inputPkgs = with args; with args.inputs; [ compose2nix.packages."${pkgs.system}".default ];
    enable = [
      # keep-sorted start
      "AI"
      "anime"
      "audio"
      "browser"
      "chat"
      "doc"
      "download"
      "editor"
      "encrypt"
      "grammar"
      "image"
      "mail"
      "math"
      "network"
      "nix"
      "note"
      "presentation"
      "proxy"
      "rss"
      "shell"
      "system"
      "task"
      "translate"
      "versionControl"
      "video"
      # keep-sorted end
    ];
  }
)
