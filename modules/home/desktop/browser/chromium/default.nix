{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      chromium = {
        extensions = [
          { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
          { id = "hfjbmagddngcpeloejdejnfgbamkjaeg"; } # vimium C
          { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # dark reader
        ];
      };
    };
  }
)
