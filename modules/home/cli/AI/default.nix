{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "aichat"
      "piper-tts"
      "tgpt"
    ];
  }
)
