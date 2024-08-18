{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "rustypaste-cli";
    confs = {
      rustypaste = ./config.toml;
    };
  }
)
