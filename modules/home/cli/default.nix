{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "gnumake"
      "pipx"
      "podman"
      "podman-compose"
    ];
    files = {
      ".ssh./.keep" = "";
    };
    inputPkgs =
      with args;
      with args.inputs;
      [
        compose2nix.packages."${pkgs.system}".default
        nyaa.packages."${pkgs.system}".default
        sig.packages."${pkgs.system}".default
      ];
    enable = [
      "AI"
      "anime"
      "audio"
      "browser"
      "chat"
      "doc"
      "download"
      "editor"
      "encrypt"
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
    ];
  }
)
