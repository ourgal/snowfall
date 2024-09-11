{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    servs = {
      kdeconnect = {
        indicator = true;
      };
    };
    progs = {
      fish = {
        functions = {
          kde-clip = {
            body = ''
              kdeconnect-cli -l --name-only | fzf | xargs -I device kdeconnect-cli --send-clipboard -n device
            '';
            description = "kde-connect cli send clipboard";
          };
        };
      };
    };
  }
)
