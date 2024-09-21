{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "buku"
      "bukubrow"
    ];
    progs = {
      fish = {
        shellAbbrs = {
          bb = "buku";
        };
        functions = {
          fzf-buku = {
            body = ''
              # Save newline-separated string into an array
              set -l website (buku -p -f 5 | column -ts\t | fzf --multi)

              # Open each website
              for i in $website
                  set index (echo "$i" | awk '{print $1}')
                  buku -p $index
                  buku -o $index
              end
            '';
            description = "fzf buku";
          };
        };

      };
    };
  }
)
