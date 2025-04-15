args:
args.module (
  args
  // {
    path = ./.;
    progs.nixvim.plugins.auto-save = {
      enable = true;
      settings = {
        noautocmd = false;
        enabled = true;
      };
    };
  }
)
