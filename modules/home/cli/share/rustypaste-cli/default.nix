args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "rustypaste-cli";
    confs."rustypaste/config.toml" = {
      server.address = "http://rustypaste.zxc.cn";
      paste.oneshot = false;
      style.prettify = true;
    };
  }
)
