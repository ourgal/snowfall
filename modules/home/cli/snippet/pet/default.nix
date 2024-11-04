args:
args.module (
  args
  // {
    path = ./.;
    progs.pet = {
      settings = {
        General = {
          format = "[$description]	$tags	$command";
        };
      };
      snippets = [
        {
          command = ''
            set -o errexit
            set -o nounset
            set -o pipefail

            nap ci/treefmt.toml > treefmt.toml
            nap ci/lefthook.yml > lefthook.yml
            mkdir -p .lefthook/commit-msg/
            nap ci/commitlint.sh > .lefthook/commit-msg/commitlint.sh
            lefthook install
          '';
          description = "lefthook";
          tag = [
            "git"
            "hook"
          ];
        }
        {
          command = "sudo dmidecode -t 2";
          description = "motherboard";
          tag = [
            "sys"
            "motherboard"
          ];
        }
        {
          command = "ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'";
          description = "current lan ip";
          tag = [ "network" ];
        }
      ];
    };
  }
)
