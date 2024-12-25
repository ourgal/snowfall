args:
args.module (
  args
  // {
    path = ./.;
    progs.atuin.settings = {
      enter_accept = true;
      sync_address = "https://api.atuin.sh";
      sync_frequency = "5m";
      dotfiles.enabled = true;
      sync.records = true;
    };
  }
)
