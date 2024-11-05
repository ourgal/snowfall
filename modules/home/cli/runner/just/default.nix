args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "just";
    progs.fish.functions.".j" = {
      body = "just --justfile ~/.user.justfile --working-directory . $argv";
      description = "user just";
    };
    files.".user.justfile" = ''
      defualt: help

      wttr:
        @cache -s "$(date +%Y-%m-%d)" -- curl -s 'https://wttr.in/'

      wan:
        @cache -s "$(date +%Y-%m-%d)" -- curl -s 'https://ifconfig.io/'

      lan:
        @ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'

      text text:
        @echo "{{ text }}" | curl -F file=@- 0x0.st

      url url:
        @curl -F url={{ url }} https://shorta.link

      file file:
        @curl -F file=@{{ file }} https://0x0.st

      help:
        @just --list --justfile ~/.user.justfile
    '';
  }
)
